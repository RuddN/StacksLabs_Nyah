import java.util.Stack;
import java.util.Arrays;

void setup() {
  String[] lines=loadStrings("circus.txt");
  Stack<String> nameStack=new Stack<String>();
  //System.out.println(Arrays.toString(lines));
  int n=0;
  
  for (int i=0; i<lines.length; i++) {
    if (isNumber(lines[i])&&Integer.parseInt(lines[i])!=0) {
      n++;
      for (int j=1; j<=i+Integer.parseInt(lines[i]); j+=2) {
        nameStack.push(lines[j]);
      }
      for (int j=i+Integer.parseInt(lines[i]); j>=i+1; j-=2) {
        nameStack.push(lines[j]);
      }
      nameStack.push("SET "+n);
      clearStack(nameStack);
    }
  }
}

boolean isNumber(String str) {
  try {
    int i = Integer.parseInt(str);
  } 
  catch (NumberFormatException nfe) {
    return false;
  }
  return true;
}

void clearStack(Stack<String> stack) {
  while (stack.empty()!=true)
  {
    System.out.print(stack.pop()+ "\n");
  }
}
