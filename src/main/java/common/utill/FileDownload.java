package common.utill;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletResponse;

public class FileDownload {
	
	public static void getFileDownload(HttpServletResponse response, String saveDirectory, String originalFilename,
			String renamedFilename) throws UnsupportedEncodingException, IOException, FileNotFoundException {
		response.setContentType("application/octet-stream");
		
		String resFilename = new String(originalFilename.getBytes("utf-8"), "iso-8859-1");
		response.setHeader("Content-Disposition", "attachment;filename=" + resFilename);

		File file = new File(saveDirectory, renamedFilename);
		
		try (
			BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
			BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
		){
			byte[] buffer = new byte[8192];
			int len = 0;
			while((len = bis.read(buffer)) != -1) {
				bos.write(buffer, 0, len);
			}
		}
	}

}
