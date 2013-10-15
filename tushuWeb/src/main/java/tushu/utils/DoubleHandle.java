package tushu.utils;

import java.math.BigDecimal;

public class DoubleHandle {

	public static double handle(double value){
		double result = 0;
		
		BigDecimal b = new BigDecimal(value);   
        b = b.setScale(2, BigDecimal.ROUND_HALF_UP);
        result = b.doubleValue();
        
		return result;
	}
}
