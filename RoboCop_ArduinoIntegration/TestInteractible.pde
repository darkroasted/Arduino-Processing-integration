

class TestInteractible implements Interactible { 
    //Enter your code that should happen when the START button is clicked
  void startPressed(boolean isOn){
    println("[TEST] Started:" + isOn);
  }

  //Enter your code that should happen when the YES button is clicked
  void yesPressed(){
    println("[TEST] YES");
  }

  //Enter your code that should happen when the NO button is clicked
  void noPressed(){
     println("[TEST] NO");
  }
}
