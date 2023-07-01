class Values {
  static getIntakePerWeek(
      int intakePerDose, int intakePerDay, int daysPerWeek) {
    return intakePerDose * intakePerDay * daysPerWeek;
  }
}
