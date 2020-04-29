import java.util.Stack;
import java.util.Arrays;

int numSets;
Stack<String> nameStack;
String[] lines;

void setup() {
  lines=loadStrings("circus.txt");
  nameStack=new Stack<String>();
  //System.out.println(Arrays.toString(lines));
  numSets=0;
  
  System.out.println("Version 1:\n");
  
  runSet(1, 7);
  runSet(9, 14);
  runSet(16, 20);
  
  System.out.println("\n\n\nVersion 2:\n");

  /*Note: I attempted to figure this out by parsing all the 
   sets at once, but for some reason It was going a bit insane.
   I left my work on that below unsolved, but then decided to 
   fix it later on. Both forms of the lab should work.
   */

  int n=0;

  for (int i=0; i<lines.length; i++) {
    if (isNumber(lines[i])&&Integer.parseInt(lines[i])!=0) {
      n++;
      for (int j=i+2; j<=i+Integer.parseInt(lines[i]); j+=2) {
        nameStack.push(lines[j]);
      }
      if ((Integer.parseInt(lines[i]))%2==0) {
        for (int j=i+Integer.parseInt(lines[i])-1; j>=i+1; j-=2) {
          nameStack.push(lines[j]);
        }
      } else {
        for (int j=i+Integer.parseInt(lines[i]); j>=i+1; j-=2) {
          nameStack.push(lines[j]);
        }
      }
      nameStack.push("SET "+n);
      clearStack(nameStack);
      System.out.println("");
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

void runSet(int start, int end) {
  numSets++;
  for (int j=start+1; j<=end; j+=2) {
    nameStack.push(lines[j]);
  }
  if ((end-start)%2==1) {
    for (int j=end-1; j>=start; j-=2) {
      nameStack.push(lines[j]);
    }
  } else {
    for (int j=end; j>=start; j-=2) {
      nameStack.push(lines[j]);
    }
  }
  nameStack.push("SET "+numSets);
  clearStack(nameStack);
  System.out.println("");
}
