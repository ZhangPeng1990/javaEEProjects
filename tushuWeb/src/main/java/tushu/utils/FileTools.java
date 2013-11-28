package tushu.utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;


public class FileTools {

	public static String readTxt(File file){
		StringBuffer buffer = null;
		BufferedReader br = null;
		String content = null;
		System.out.println("正在解析txt文件...");
		buffer = new StringBuffer();
		try {
			br = new BufferedReader(new FileReader(file));
			try {
				while ((content = br.readLine()) != null) {
					buffer.append(content);
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}finally{
			if(br != null){
				try {
					br.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return buffer != null ? buffer.toString() : null;
	}
	/**
	 * 列出所有硬盘分区
	 * @return
	 */
	public static File[] listRoots(){
		File[] roots = File.listRoots();
		return roots;
	}
	
	/**
	 * 列出所有硬盘容量大于0的分区
	 * @return
	 */
	public static List<File> listUsingRoots(){
		File[] tempRoots = File.listRoots();
		List<File> roots = new ArrayList<File>();
		for(File file : tempRoots){
			if(file.getTotalSpace() > 0){
				roots.add(file);
			}
		}
		return roots;
	}
	
	/**
	 * 获取操作系统名称
	 * @return
	 */
	public static String getSytemName(){
		String os = "Unknown!";
		os = System.getProperty("os.name");
		return os;
	}
	
	/**
	 * 获取一个地址下的所有文件和文件夹
	 * @param path
	 * @return
	 */
	public static List<File> listAllFiles(String path){
		File file = new File(path);
		List<File> files = new ArrayList<File>();
		if(file.exists()){
			
			if(file.isFile()){
				files.add(file);
			}
			if(file.isDirectory()){
				File[] f = file.listFiles();
				for(File f1 : f){
					files.add(f1);
				}
			}
		}
		return files;
	}
	
	/**
	 * 在指定目录下创建文件夹，return true成功
	 * @param path
	 */
	public static boolean createFolder(String path){
		File file = new File(path);
		if(!file.exists()){
			return file.mkdir();
		}
		return false;
	}
	
	/**
	 *  删除指定目录下的文件或文件夹，return true删除成功
	 *  当文件夹非空时进行遍历删除
	 * @param path
	 * @return 
	 */
	public static boolean deleteFile(String path){
		File file = new File(path);
		if(file.exists()){
			if(file.isDirectory()){
				File[] files = file.listFiles();
				if(files != null && files.length > 0){
					for(File f : files){
						deleteFile(f.getPath());
					}
				}
			}
			
			return file.delete();
		}
		return false;
	}
	
	 public static String doubleFormat(double d){   
	        DecimalFormat df = new DecimalFormat("0.##");   
	        return df.format(d);                   
	    }
	 
	 /**
     * 生产文件 如果文件所在路径不存在则生成路径
     *
     * @param fileName
     *            文件名 带路径
     * @param isDirectory 是否为路径
     * @return
     * @author 
     * @date 2008-8-27
     */
    public static File buildFile(String fileName, boolean isDirectory) {
        File target = new File(fileName);
        if (isDirectory) {
            target.mkdirs();
        } else {
            if (!target.getParentFile().exists()) {
                target.getParentFile().mkdirs();
                target = new File(target.getAbsolutePath());
            }
        }
        return target;
    } 
}
