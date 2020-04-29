void setup() {
  IntStack test = new IntStack();
  test.push(5);
  test.push(7);
  test.push(9);
  System.out.println(test);
  System.out.println(test.isEmpty());
  System.out.println(test.pop());
  System.out.println(test.peek());
  System.out.println(test.pop());
  System.out.println(test.pop());
  //System.out.println(test.peek());  //blows up
  System.out.println(test.isEmpty());
  System.out.println(test);
}

class IntStack {

  private ArrayList<Integer> loi;

  public IntStack() {
    loi = new ArrayList<Integer>();
  }

  public void push(int item) {
    loi.add(item);
  }

  public int pop() {
    int a=loi.get(loi.size()-1);
    loi.remove(loi.size()-1);
    return a;
  }

  public boolean isEmpty() {
    if (loi.size()==0) {
      return true;
    } else {
      return false;
    }
  }

  public int peek() {
    return loi.get(loi.size()-1);
  }

  public String toString() {
    String mid="";
    for (int num : loi) {
      mid+=num+", ";
    }
    if (mid.length()>=2)
      mid=mid.substring(0, mid.length()-2);
    return "["+mid+"]";
  }
}
