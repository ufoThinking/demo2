package com.test.demo;

import java.io.*;


/**
 * io的基础练习
 * @author 刘桓
 *
 */
public class IODemo {

	/**
	 * @param args
	 * 字节流基础
	 */
	public static void main(String[] args) {
		//PutStream();
		//ReWr();
		Flush();
	}
	
	public static void PutStream(){
		int b =0;
		FileInputStream in = null;
		FileOutputStream out = null;
		try {
			in = new FileInputStream("D:\\Hldn\\Log375\\375_2017-11-14_03.log");
			out = new FileOutputStream("D:\\HW.java");
			while( (b = in.read()) != -1){
				//System.out.write(b);
				out.write(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				in.close();
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
	}

	/**
	 * 字符流
	 */
	public static void ReWr(){
		FileReader reader = null;
		FileWriter write = null;
		try {
			reader = new FileReader("D:\\Hldn\\Log375\\375_2017-11-14_03.log");
			write = new FileWriter("D:\\write.java");
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				reader.close();
				write.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			
		}
		
		
		
		
	}

	/**
	 * 缓存流
	 */
	public static void Flush(){
		int b =0;
		FileInputStream in = null;
		FileOutputStream out = null;
		BufferedOutputStream bos = null;
		BufferedInputStream  bis = null;
		try {
			in = new FileInputStream("D:\\write.java");
			out = new FileOutputStream("D:\\buffer.java");
			bis = new BufferedInputStream(in);
			bos = new BufferedOutputStream(out);
			while((b = bis.read()) !=  -1){
				System.out.println(b);
				bos.write(b);
			}
			bos.flush();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				bos.close();
				bis.close();
				out.close();
				in.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
