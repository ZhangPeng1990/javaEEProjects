package tushu.system.jmx;

public class AppControl implements AppControlMBean {

	@Override
	public String startApp() {
		System.out.println("模拟启动爬虫程序...");
		String message = "启动成功";
		return message;
	}

	@Override
	public String stopApp() {
		System.out.println("模拟停止爬虫程序...");
		String message = "停止成功";
		return message;
	}

	
}
