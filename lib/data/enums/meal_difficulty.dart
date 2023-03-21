enum MealDifficulty{
  easy,
  medium,
  difficult;

  @override
  String toString() {
    switch(this){
      case MealDifficulty.easy:
        return "Easy";
      
      case MealDifficulty.medium:
      return "Medium";

      case MealDifficulty.difficult:
      return "Difficult";

      default:
      return 'Unknown';
    }
  }
}