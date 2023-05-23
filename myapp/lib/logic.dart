mixin Logic{
  static double compute({required double height, required double weight}){
    height = height / 100;
    return weight / (height * height);
  }
}