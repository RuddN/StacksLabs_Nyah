import java.util.Stack;
import java.util.Arrays;

void setup() {
  PostFix test = new PostFix("2 7 + 1 2 + +");
  test.solve();
  System.out.println(test);

  test.setExpression("1 2 3 4 + + +");
  test.solve();
  System.out.println(test);
  
  test.setExpression("9 3 * 8 / 4 +");
  test.solve();
  System.out.println(test);
  
  test.setExpression("3 3 + 7 * 9 2 / +");
  test.solve();
  System.out.println(test);
  
  test.setExpression("9 3 / 2 * 7 9 * + 4 -");
  test.solve();
  System.out.println(test);
  
  test.setExpression("5 5 + 2 * 4 / 9 +");
  test.solve();
  System.out.println(test);
}

class PostFix {
  Stack<Double> stack;
  String expression;

  PostFix() {
    stack = new Stack<Double>();
    setExpression("");
  }

  PostFix(String exp) {
    stack = new Stack<Double>();
    setExpression(exp);
  }

  void setExpression(String exp) {
    expression = exp;
  }

  double calc(double one, double two, String op) {
    if(op.equals("-")){
      return two-one;
    } else if(op.equals("+")){
      return two+one;
    }else if(op.equals("/")){
      return two/one;
    }else if(op.equals("*")){
      return two*one;
    }
    return 0;
  }

  double solve() {
    String[] parts = expression.split(" ");
    //System.out.println(Arrays.toString(parts));
    for (String part : parts) {
      if (isNumber(part)) {
        stack.push(Double.parseDouble(part));
      } else {
        Double num=calc(stack.pop(), stack.pop(), part);
        //System.out.println(num);
        stack.push(num);
      }
    }
    return stack.pop();
  }

  String toString() {
    return expression + " = " + solve();
  }
}

boolean isNumber(String str) {
  try {
    Double.parseDouble(str);
  } 
  catch (NumberFormatException nfe) {
    return false;
  }
  return true;
}
