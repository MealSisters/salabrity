package common;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

/**
 * @author 박수진
 */
public class SalabrityFileRenamePolicy implements FileRenamePolicy {

	@Override
	public File rename(File oldFile) {
		File newFile = null;
		
		do {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS_");
			DecimalFormat df = new DecimalFormat("000");
			
			String oldName = oldFile.getName();
			String ext = "";
			int dotIndex = oldName.lastIndexOf(".");
			if(dotIndex > -1) ext = oldName.substring(dotIndex);
			
			String newName = sdf.format(new Date()) + df.format(Math.random() * 1000) + ext;
			newFile = new File(oldFile.getParent(), newName);
			System.out.println("newFile@SalabrityFileRenamePolicy = " + newFile);
		} while(!createNewFile(newFile));
		
		return newFile;
	}

	private boolean createNewFile(File newFile) {
		try {
			return newFile.createNewFile();
		} catch (IOException ignored) {
			return false;
		}
	}

}
