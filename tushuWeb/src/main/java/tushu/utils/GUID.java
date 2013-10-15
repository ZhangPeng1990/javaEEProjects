package tushu.utils;

import java.util.UUID;

public class GUID {

	  public static void main(String[] args)
	  {
	    // 产生 5 个 GUID
	    for (int i = 0; i < 5; i++)
	    {
	      // 创建 GUID 对象
	      UUID uuid = UUID.randomUUID();
	      // 得到对象产生的ID
	      String a = uuid.toString();
	      // 转换为大写
	      a = a.toUpperCase();
	      // 替换 -
	      // a = a.replaceAll("-", "");
	      System.out.println(a);
	    }
	  }
	  
	  public static String generatorGUID(){
		  UUID uuid = UUID.randomUUID();
	      String a = uuid.toString();
	      a = a.toUpperCase();
	      return a;
	  }
}
