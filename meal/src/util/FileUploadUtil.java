package util;

import java.io.File;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

public class FileUploadUtil {

	// �ϴ���һ�ļ�
	public static String uploadSingleFile(Part part, HttpServletRequest request) {
		String path = null;
		String fileName = getFileName(part);
		if (!fileName.equals("")) {
			// �õ��ϴ��ļ����ļ���չ��
			String fileExtName = getFileExtName(part);
			String newFileName = System.currentTimeMillis() + fileExtName;
			// �õ��ϴ��ļ�����·���ķ�������Ӳ������·��
			String savePath = request.getServletContext().getRealPath("/images/uploads");
			File f = new File(savePath);
			if (!f.exists()) {
				f.mkdirs();
			}
			// �ļ��ϴ�
			try {
				part.write(savePath + File.separator + newFileName);
				path = "images/uploads/" + newFileName;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return path;
	}

	/**
	 * ��������ͷ�������ļ��� ����ͷ�ĸ�ʽ�������google������£�form-data; name="file";
	 * filename="snmp4j--api.zip" IE������£�form-data; name="file";
	 * filename="E:\snmp4j--api.zip"
	 * 
	 * @param header ����ͷ
	 * @return �ļ���
	 */
	public static String getFileName(Part part) {
		/**
		 * String[] tempArr1 = header.split(";");����ִ����֮���ڲ�ͬ��������£�tempArr1���������������������
		 * �������google������£�tempArr1={form-data,name="file",filename="snmp4j--api.zip"}
		 * IE������£�tempArr1={form-data,name="file",filename="E:\snmp4j--api.zip"}
		 */
		String header = part.getHeader("content-disposition");
		String[] tempArr1 = header.split(";");
		/**
		 * �������google������£�tempArr2={filename,"snmp4j--api.zip"}
		 * IE������£�tempArr2={filename,"E:\snmp4j--api.zip"}
		 */
		String[] tempArr2 = tempArr1[2].split("=");
		// ��ȡ�ļ��������ݸ����������д��
		String fileName = tempArr2[1].substring(tempArr2[1].lastIndexOf("\\") + 1).replaceAll("\"", "");
		return fileName;
	}

	public static String getFileExtName(Part part) {
		String fileName = getFileName(part);
		if(fileName.equals("")) {
			return "";
		}else {
			return fileName.substring(fileName.lastIndexOf("."));
		}
	}
}
