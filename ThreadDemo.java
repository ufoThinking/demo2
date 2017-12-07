package thread.demo;

/**
 * 进行多线程的基础的练习
 * @author 刘桓
 *
 */
public class Test1 {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		//传统该方式一：创建线程    这里new的是一个子类
		Thread thread = new Thread(){
			@Override
			public void run() {
				while(true){
					try {
						Thread.sleep(500);
					} catch (InterruptedException e) {
						e.printStackTrace();
					}
					System.out.println("Thread  "+Thread.currentThread().getName());
					System.out.println("this  "+this.getName());//不建议使用
				}
			}
		};
		thread.start();
		
		//传统方式二：创建线程 使用runnable对象 
		Thread thread2 = new Thread(new Runnable(){
			@Override
			public void run() {
				while(true){
					try {
						Thread.sleep(500);
					} catch (InterruptedException e) {
						e.printStackTrace();
					}
					System.out.println("Runnable  "+Thread.currentThread().getName());
				}
			}
		});
		thread2.start();
		
		//其他方式：new Thread的子类
		new Thread(
				new Runnable(){
					@Override
					public void run() {
						while(true){
							try {
								Thread.sleep(500);
								System.out.println("new Runnable  "+Thread.currentThread().getName());
							} catch (InterruptedException e) {
								e.printStackTrace();
							}
						}
					}
					
				}
		){
			public void run(){
				while(true){
					try {
						Thread.sleep(500);
						System.out.println("new Thread  "+Thread.currentThread().getName());
					} catch (InterruptedException e) {
						e.printStackTrace();
					}
				}
			}
		}.start();
	}
}
