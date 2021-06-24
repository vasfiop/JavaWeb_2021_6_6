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

	// 上传单一文件
	public static String uploadSingleFile(Part part, HttpServletRequest request) {
		String path = null;
		String fileName = getFileName(part);
		if (!fileName.equals("")) {
			// 得到上传文件的文件扩展名
			String fileExtName = getFileExtName(part);
			String newFileName = time + fileExtName;
			// 得到上传文件保存路径的服务器端硬盘物理路径
			String savePath = request.getServletContext().getRealPath("/resources/img/uploads");
			File f = new File(savePath);
			if (!f.exists()) {
				System.out.println(new Time().getAllTime() + " 未找到该路径");
				f.mkdirs();
			}
			// 文件上传
			try {
				part.write(savePath + File.separator + newFileName);
				path = "uploads/" + newFileName;
				filename = newFileName;
				System.out.println(new Time().getAllTime() + " Tomcat 文件上传成功");
			} catch (IOException e) {
				e.printStackTrace();
				System.out.println(new Time().getAllTime() + " Tomcat 文件上传失败");
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
			System.out.println(new Time().getAllTime() + " local 文件上传失败");
		}
	}

	public static void filecopy() throws IOException {
		String oldpath = "D:\\Tomcat\\tomcat-9.0.46\\webapps\\game\\resources\\img\\uploads";
		String savepath = "C:\\Users\\DELL\\Desktop\\java\\eclipseweb\\game\\WebContent\\resources\\img\\uploads";
		if (filename == null) {
			System.out.println(new Time().getAllTime() + " 文件名称空！");
			return;
		}
		File old = new File(oldpath + File.separator + filename);
		if (!old.exists()) {
			System.out.println(new Time().getAllTime() + " 未找到该文件!");
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
				System.out.println(new Time().getAllTime() + " 文件流获取失败");
			}
			System.out.println(new Time().getAllTime() + " 本地文件复制成功！");
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println(new Time().getAllTime() + " 本地文件复制失败!");
		}
	}

	/**
	 * 根据请求头解析出文件名 请求头的格式：火狐和google浏览器下：form-data; name="file";
	 * filename="snmp4j--api.zip" IE浏览器下：form-data; name="file";
	 * filename="E:\snmp4j--api.zip"
	 * 
	 * @param header 请求头
	 * @return 文件名
	 */
	public static String getFileName(Part part) {
		/**
		 * String[] tempArr1 = header.split(";");代码执行完之后，在不同的浏览器下，tempArr1数组里面的内容稍有区别
		 * 火狐或者google浏览器下：tempArr1={form-data,name="file",filename="snmp4j--api.zip"}
		 * IE浏览器下：tempArr1={form-data,name="file",filename="E:\snmp4j--api.zip"}
		 */
		String header = part.getHeader("content-disposition");
		String[] tempArr1 = header.split(";");
		/**
		 * 火狐或者google浏览器下：tempArr2={filename,"snmp4j--api.zip"}
		 * IE浏览器下：tempArr2={filename,"E:\snmp4j--api.zip"}
		 */
		String[] tempArr2 = tempArr1[2].split("=");
		// 获取文件名，兼容各种浏览器的写法
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
