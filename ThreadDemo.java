package thread.demo;

/**
 * ���ж��̵߳Ļ�������ϰ
 * @author ����
 *
 */
public class Test1 {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		//��ͳ�÷�ʽһ�������߳�    ����new����һ������
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
					System.out.println("this  "+this.getName());//������ʹ��
				}
			}
		};
		thread.start();
		
		//��ͳ��ʽ���������߳� ʹ��runnable���� 
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
		
		//������ʽ��new Thread������
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
