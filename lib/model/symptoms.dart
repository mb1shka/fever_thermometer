enum Symptoms {
  abdominalDiscomfort,
  bradycardia,
  bodyAchesAndPains,
  chill,
  cough,
  drowsiness,
  dizziness,
  headache,
  fever,
  hoarseness,
  highBloodPressure,
  irritability,
  migraine,
  nausea,
  rash,
  shortnessOfBreath,
  rapidPulse,
  lossOfAppetite,
  sleepDisorder,
}

extension SymptomsExt on Symptoms {

  static Symptoms? fromString(String value) {
    switch (value) {
      case 'abdominalDiscomfort':
        return Symptoms.abdominalDiscomfort;
      case 'bradycardia':
        return Symptoms.bradycardia;
      case 'bodyAchesAndPains':
        return Symptoms.bodyAchesAndPains;
      case 'chill':
        return Symptoms.chill;
      case 'cough':
        return Symptoms.cough;
      case 'drowsiness':
        return Symptoms.drowsiness;
      case 'dizziness':
        return Symptoms.dizziness;
      case 'headache':
        return Symptoms.headache;
      case 'fever':
        return Symptoms.fever;
      case 'hoarseness':
        return Symptoms.hoarseness;
      case 'highBloodPressure':
        return Symptoms.highBloodPressure;
      case 'irritability':
        return Symptoms.irritability;
      case 'migraine':
        return Symptoms.migraine;
      case 'nausea':
        return Symptoms.nausea;
      case 'rash':
        return Symptoms.rash;
      case 'shortnessOfBreath':
        return Symptoms.shortnessOfBreath;
      case 'rapidPulse':
        return Symptoms.rapidPulse;
      case 'lossOfAppetite':
        return Symptoms.lossOfAppetite;
      case 'sleepDisorder':
        return Symptoms.sleepDisorder;
    }
  }

  String asString() {
    switch (this) {
      case Symptoms.abdominalDiscomfort:
        return 'Abdominal discomfort';
      case Symptoms.bradycardia:
        return 'Bradycardia';
      case Symptoms.bodyAchesAndPains:
        return 'Body aches and pains';
      case Symptoms.chill:
        return 'Chill';
      case Symptoms.cough:
        return 'Cough';
      case Symptoms.drowsiness:
        return 'Drowsiness';
      case Symptoms.dizziness:
        return 'Dizziness';
      case Symptoms.headache:
        return 'Headache';
      case Symptoms.fever:
        return 'Fever';
      case Symptoms.hoarseness:
        return 'Hoarseness';
      case Symptoms.highBloodPressure:
        return 'High blood pressure';
      case Symptoms.irritability:
        return 'Irritability';
      case Symptoms.migraine:
        return 'Migraine';
      case Symptoms.nausea:
        return 'Nausea';
      case Symptoms.rash:
        return 'Rash';
      case Symptoms.shortnessOfBreath:
        return 'Shortness of breath';
      case Symptoms.rapidPulse:
        return 'Rapid pulse';
      case Symptoms.lossOfAppetite:
        return 'Loss of appetite';
      case Symptoms.sleepDisorder:
        return 'Sleep disorder';
    }
  }
}