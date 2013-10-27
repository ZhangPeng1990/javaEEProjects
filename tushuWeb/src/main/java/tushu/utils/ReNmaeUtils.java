package tushu.utils;

/**
 * 重命名工具类
 * @author zp
 *
 */
public class ReNmaeUtils {

	public static String reName(String name){
		String[] names = name.split("\\.");
		Long time = System.currentTimeMillis();
		if(names != null && names.length > 0){
			String newName = time.toString() + "." + names[names.length - 1];
			return newName;
		}
		return time.toString();
	}
	
	public static String getNewName(String name,String regex){
		String[] names = name.split("\\.");
		if(names != null && names.length ==2){
			String newName = names[names.length - 2] + regex + "." + names[names.length - 1];
			return newName;
		}
		return null;
	}
}
