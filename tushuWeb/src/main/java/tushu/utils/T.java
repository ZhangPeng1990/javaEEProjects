package tushu.utils;

public class T {


	public static void main(String[] args) {

		JpegTool j = new JpegTool();
		try {
			j.SetScale(0.7);
			j.SetSmallHeight(70);
			j.SetSmallWidth(70);
			j.doFinal("F:\\pic\\11.jpg","F:\\pic\\11_temp.jpg");
		} catch (JpegToolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
