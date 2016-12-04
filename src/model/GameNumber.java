/**
 * 
 */
package model;

import java.util.Random;

/**
 * @author chaos7703
 *
 */
public class GameNumber {
	
	private int value;

	/**
	 * 
	 */
	public GameNumber()
	{
	}

	
	/**
	 * @param value
	 */
	public GameNumber(int value)
	{
		if (value < 0) {
			this.value = 0;
		} else {
			this.value = value;
		}		
	}
	

	/**
	 * @return the value
	 */
	public int getValue()
	{
		return value;
	}
	

	/**
	 * @param value the value to set
	 */
	public void setValue(int value)
	{
		if (value < 0) {
			this.value = 0;
		} else {
			this.value = value;
		}		
	}
	
	
	/**
	 * Generates pseudo-random number between minimum & maximum
	 * @param minimum The minimum acceptable value
	 * @param maximum The maximum acceptable value
	 */
	public void setRandom(int minimum, int maximum)
	{
		Random random = new Random();
		this.value = minimum + random.nextInt(maximum - minimum);
	}
	
	
	/**
	 * Increments the v
	 */
	public void increment()
	{
		this.value++;
	}

	

}
