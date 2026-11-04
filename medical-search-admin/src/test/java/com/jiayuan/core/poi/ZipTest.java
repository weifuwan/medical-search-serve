package com.jiayuan.core.poi;

import cn.hutool.core.util.ZipUtil;

import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

public class ZipTest {
    public static void main(String[] args) throws IOException {
        ZipUtil.zip("D:\\temp\\export\\20250326154012A001\\tmp", "D:\\profile\\m.zip");

//        zipDirectory("D:\\temp\\export\\20250326154012A001\\tmp", "m.zip");
    }

    public static void zipDirectory(String sourceDirPath, String zipFilePath) throws IOException {
        Path sourceDir = Paths.get(sourceDirPath);
        try (ZipOutputStream zos = new ZipOutputStream(new FileOutputStream(zipFilePath))) {
            Files.walk(sourceDir)
                    .filter(path -> !Files.isDirectory(path))
                    .forEach(path -> {
                        ZipEntry zipEntry = new ZipEntry(sourceDir.relativize(path).toString());
                        try {
                            zos.putNextEntry(zipEntry);
                            Files.copy(path, zos);
                            zos.closeEntry();
                        } catch (IOException e) {
                            System.err.println("Error adding file to zip: " + path);
                            e.printStackTrace();
                        }
                    });
        }
    }

}
