import { Request, Response } from 'express';

const waitTime = (time: number = 100) => {
    return new Promise((resolve) => {
        setTimeout(() => {
            resolve(true);
        }, time);
    })
}

export default {
    'GET /api/historyList': async (req: Request, res: Response) => {
        await waitTime(1000);
        res.send({
            code: 200,
            data: [
                {
                    id: 1,
                    content: '白细胞[检验数据.中文名称]'
                },
                {
                    id: 2,
                    content: '上呼吸道感染'
                },
                {
                    id: 3,
                    content: '女'
                },
                {
                    id: 4,
                    content: '红细胞[检验数据.中文名称]'
                },
                {
                    id: 5,
                    content: '腹部[检查数据.项目名称] and 左臂.'
                },
                {
                    id: 6,
                    content: '白细胞[检验数据.中文名称]'
                },
                {
                    id: 7,
                    content: '上呼吸道感染'
                },
                {
                    id: 8,
                    content: '女'
                },
                {
                    id: 9,
                    content: '红细胞[检验数据.中文名称]'
                },
            ]
        });
    },
};
