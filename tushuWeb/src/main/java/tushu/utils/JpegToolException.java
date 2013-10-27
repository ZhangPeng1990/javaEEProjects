package tushu.utils;

public class JpegToolException extends Exception {
	
	private static final long serialVersionUID = 1L;
	
	private String errMsg = ""; 
    public JpegToolException(String errMsg) 
    { 
            this.errMsg = errMsg; 
    } 

    public String getMsg(){ 
        return "JpegToolException:"+this.errMsg; 
    } 
    
}