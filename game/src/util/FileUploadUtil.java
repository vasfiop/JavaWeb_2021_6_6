package util;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

public class FileUploadUtil {
	static String time = String.valueOf(System.currentTimeMillis());
	static String filename = null;
	private static BufferedOutputStream bout;
	private static FileInputStream in;

	// �ϴ���һ�ļ�
	public static String uploadSingleFile(Part part, HttpServletRequest request) {
		String path = null;
		String fileName = getFileName(part);
		if (!fileName.equals("")) {
			// �õ��ϴ��ļ����ļ���չ��
			String fileExtName = getFileExtName(part);
			String newFileName = time + fileExtName;
			// �õ��ϴ��ļ�����·���ķ�������Ӳ������·��
			String savePath = request.getServletContext().getRealPath("/resources/img/uploads");
			File f = new File(savePath);
			if (!f.exists()) {
				System.out.println(new Time().getAllTime() + " δ�ҵ���·��");
				f.mkdirs();
			}
			// �ļ��ϴ�
			try {
				part.write(savePath + File.separator + newFileName);
				path = "uploads/" + newFileName;
				filename = newFileName;
				System.out.println(new Time().getAllTime() + " Tomcat �ļ��ϴ��ɹ�");
			} catch (IOException e) {
				e.printStackTrace();
				System.out.println(new Time().getAllTime() + " Tomcat �ļ��ϴ�ʧ��");
			}
		}

		return path;
	}

	public static void localupload(Part part) {
		String savepath = "C:/Users/DELL/Desktop/java/eclipseweb/game/WebContent/resources/img/uploads";
		File file = new File(savepath);
		String newfilename = time + getFileExtName(part);

		if (!file.exists())
			file.mkdirs();

		try {
			part.write(savepath + File.separator + newfilename);
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println(new Time().getAllTime() + " local �ļ��ϴ�ʧ��");
		}
	}

	public static void filecopy() throws IOException {
		String oldpath = "D:\\Tomcat\\tomcat-9.0.46\\webapps\\game\\resources\\img\\uploads";
		String savepath = "C:\\Users\\DELL\\Desktop\\java\\eclipseweb\\game\\WebContent\\resources\\img\\uploads";
		if (filename == null) {
			System.out.println(new Time().getAllTime() + " �ļ����ƿգ�");
			return;
		}
		File old = new File(oldpath + File.separator + filename);
		if (!old.exists()) {
			System.out.println(new Time().getAllTime() + " δ�ҵ����ļ�!");
			return;
		}
		File local = new File(savepath + File.separator + filename);
		if (!local.exists()) {
			(new File(local.getParent())).mkdirs();
		}
		try {
			in = new FileInputStream(old);
			FileOutputStream out = new FileOutputStream(local);
			bout = new BufferedOutputStream(out);
			byte[] buf = new byte[1024];
			int b;
			try {
				while ((b = in.read(buf)) != -1) {
					bout.write(buf, 0, b);
				}
			} catch (IOException e) {
				e.printStackTrace();
				System.out.println(new Time().getAllTime() + " �ļ�����ȡʧ��");
			}
			System.out.println(new Time().getAllTime() + " �����ļ����Ƴɹ���");
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println(new Time().getAllTime() + " �����ļ�����ʧ��!");
		}
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
		if (fileName.equals("")) {
			return "";
		} else {
			return fileName.substring(fileName.lastIndexOf("."));
		}
	}
}
