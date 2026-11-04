package com.jiayuan.common.utils.uuid;

public class SnowflakeIdGenerator {
    // 起始的时间戳（可以设置为系统开始使用的时间）
    private final static long START_TIMESTAMP = 1609459200000L; // 2021-01-01 00:00:00

    // 每一部分的位数
    private final static long SEQUENCE_BIT = 12; // 序列号占用的位数
    private final static long MACHINE_BIT = 5;   // 机器标识占用的位数
    private final static long DATACENTER_BIT = 5; // 数据中心占用的位数

    // 每一部分的最大值
    private final static long MAX_SEQUENCE = ~(-1L << SEQUENCE_BIT);
    private final static long MAX_MACHINE_NUM = ~(-1L << MACHINE_BIT);
    private final static long MAX_DATACENTER_NUM = ~(-1L << DATACENTER_BIT);

    // 每一部分的位移
    private final static long MACHINE_LEFT = SEQUENCE_BIT;
    private final static long DATACENTER_LEFT = SEQUENCE_BIT + MACHINE_BIT;
    private final static long TIMESTAMP_LEFT = DATACENTER_LEFT + DATACENTER_BIT;

    private final long datacenterId; // 数据中心ID
    private final long machineId;   // 机器ID
    private long sequence = 0L; // 序列号
    private long lastTimestamp = -1L; // 上一次时间戳

    public SnowflakeIdGenerator(long datacenterId, long machineId) {
        if (datacenterId > MAX_DATACENTER_NUM || datacenterId < 0) {
            throw new IllegalArgumentException("Datacenter ID can't be greater than " + MAX_DATACENTER_NUM + " or less than 0");
        }
        if (machineId > MAX_MACHINE_NUM || machineId < 0) {
            throw new IllegalArgumentException("Machine ID can't be greater than " + MAX_MACHINE_NUM + " or less than 0");
        }
        this.datacenterId = datacenterId;
        this.machineId = machineId;
    }

    /**
     * 生成下一个ID
     */
    public synchronized long nextId() {
        long currentTimestamp = getCurrentTimestamp();

        if (currentTimestamp < lastTimestamp) {
            throw new RuntimeException("Clock moved backwards. Refusing to generate id for " + (lastTimestamp - currentTimestamp) + " milliseconds");
        }

        if (currentTimestamp == lastTimestamp) {
            // 同一毫秒内，序列号自增
            sequence = (sequence + 1) & MAX_SEQUENCE;
            if (sequence == 0) {
                // 当前毫秒的序列号用完了，等待下一毫秒
                currentTimestamp = getNextTimestamp(lastTimestamp);
            }
        } else {
            // 不同毫秒，序列号重置
            sequence = 0L;
        }

        lastTimestamp = currentTimestamp;

        // 拼接各部分数据
        return ((currentTimestamp - START_TIMESTAMP) << TIMESTAMP_LEFT) // 时间戳部分
                | (datacenterId << DATACENTER_LEFT) // 数据中心部分
                | (machineId << MACHINE_LEFT) // 机器标识部分
                | sequence; // 序列号部分
    }

    /**
     * 获取当前时间戳（毫秒）
     */
    private long getCurrentTimestamp() {
        return System.currentTimeMillis();
    }

    /**
     * 获取下一毫秒的时间戳
     */
    private long getNextTimestamp(long lastTimestamp) {
        long currentTimestamp = getCurrentTimestamp();
        while (currentTimestamp <= lastTimestamp) {
            currentTimestamp = getCurrentTimestamp();
        }
        return currentTimestamp;
    }

    public static void main(String[] args) {
        // 示例：创建一个数据中心ID为1，机器ID为1的ID生成器
        SnowflakeIdGenerator idGenerator = new SnowflakeIdGenerator(1, 1);

        // 生成10个ID
        for (int i = 0; i < 10; i++) {
            long id = idGenerator.nextId();
            System.out.println("Generated ID: " + id);
        }
    }
}
