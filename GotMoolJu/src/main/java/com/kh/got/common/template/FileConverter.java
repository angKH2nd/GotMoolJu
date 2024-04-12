package com.kh.got.common.template;

import org.springframework.web.multipart.MultipartFile;
import org.apache.commons.io.FileUtils;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

public class FileConverter {

    public static MultipartFile convert(File file) throws IOException {
        InputStream inputStream = new FileInputStream(file);
        return new MultipartFile() {
            @Override
            public String getName() {
                return file.getName();
            }

            @Override
            public String getOriginalFilename() {
                return file.getName();
            }

            @Override
            public String getContentType() {
                // You may need to adjust the content type based on your file type
                return "application/octet-stream";
            }

            @Override
            public boolean isEmpty() {
                return file.length() == 0;
            }

            @Override
            public long getSize() {
                return file.length();
            }

            @Override
            public byte[] getBytes() throws IOException {
                return FileUtils.readFileToByteArray(file);
            }

            @Override
            public InputStream getInputStream() throws IOException {
                return inputStream;
            }

            @Override
            public void transferTo(File dest) throws IOException, IllegalStateException {
                FileUtils.copyFile(file, dest);
            }
        };
    }
}