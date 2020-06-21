package com.website.WebsiteBanHang.service.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.LinkOption;
import java.nio.file.Path;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.website.WebsiteBanHang.service.ImageService;

@Transactional
@Service
public class ImageServiceImpl implements ImageService {
	private String rootName = "/tmp";

	public String uploadFile(String uploadRootPath, MultipartFile file) {
		try {
			InputStream fis = file.getInputStream();
			byte[] data = new byte[fis.available()];
			fis.read(data);

//            uploadRootPath = uploadRootPath + "/" + getFileName(file);
			FileOutputStream out = new FileOutputStream(new File(uploadRootPath + "/" + getFileName(file)));

//            Path path = Paths.get(uploadRootPath);
//            Files.copy(fis, path, new CopyOption[]{StandardCopyOption.REPLACE_EXISTING});
			out.write(data);
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("That bai");
		}

		System.out.println("Thanh cong : " + uploadRootPath + "/" + getFileName(file));

		return getFileName(file);
	}

	public String getFileName(MultipartFile filepart) {
		return filepart.getOriginalFilename().replace(" ", "-");
	}

	private void createDirectoryIfNorExist(Path path) throws IOException {
		if (Files.notExists(path, new LinkOption[0])) {
			Files.createDirectory(path);
		}

	}

	public void setRootName(String rootName) {
		this.rootName = rootName;
	}

	public String getRootName() {
		return this.rootName;
	}

	private String buildRootPath() {
		return this.getRootName() + "/" + "products" + "/";
	}
}
