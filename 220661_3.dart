class Animal {
  String? name;
  String? age;
  String healthStatus;

  Animal({required this.name, required this.age, this.healthStatus = 'Under Observation'});

  void displayDetails() {
    print('$name (${this.runtimeType}) - Age: $age, Health: $healthStatus');
  }
}

class Lion extends Animal {
  Lion({super.name, super.age});
}

class Giraffe extends Animal {
  Giraffe({super.name, super.age});
}

class FeedingSchedule {
  String animalName;
  String time;
  String foodType;
  String quantity;

  FeedingSchedule({
    required this.animalName,
    required this.time,
    required this.foodType,
    required this.quantity,
  });
}

class Exhibit {
  String name;
  List<Animal> animals = [];
  List<FeedingSchedule> feedingSchedules = [];

   Exhibit({required this.name});

  void addAnimalToExhibit(Animal animal) {
    animals.add(animal);
  }

  void addFeedingSchedule(FeedingSchedule schedule) {
    feedingSchedules.add(schedule);
  }

  void displayDetails() {
    for (Animal animal in animals) {
      print('$name :${animal.name}');
    }
  }
}

class InteractiveExhibit extends Exhibit {
  InteractiveExhibit({required String name}) : super(name: name);
  
}

class StaticExhibit extends Exhibit {
  StaticExhibit({required String name}) : super(name: name);
  
}


class Zoo {
  List<Animal> animals = [];
  List<Exhibit> exhibits = [];
  List<FeedingSchedule> feedingSchedules = [];
  List<Visitor> visitors = [];
  


  void addAnimal(Animal animal) {
    animals.add(animal);
  }

  void addExhibit(Exhibit exhibit) {
    exhibits.add(exhibit);
  }

  void addFeedingSchedule(String animalName, String time,
      {required String foodType, required String quantity}) {
    feedingSchedules.add(
      FeedingSchedule(animalName: animalName, time: time, foodType: foodType, quantity: quantity),
    );
  }
  
void addVisitor(Visitor visitor) {
    visitors.add(visitor);
  }  
  

void transferAnimal(String animalName, String fromExhibit, String toExhibit) {
  Exhibit sourceExhibit = exhibits.firstWhere((exhibit) => exhibit.name == fromExhibit);
  Exhibit targetExhibit = exhibits.firstWhere((exhibit) => exhibit.name == toExhibit);

  Animal? animal = sourceExhibit.animals.firstWhere((animal) => animal.name == animalName);

  sourceExhibit.animals.remove(animal);
  targetExhibit.animals.add(animal);

 }





void moveAnimalToExhibit(String animalName, String toExhibit) {
  for (Exhibit exhibit in exhibits) {
    if (exhibit.name == toExhibit) {
      Animal animal = animals.firstWhere(
        (animal) => animal.name == animalName,
        
      );
      if (animal.name != null && animal.name!.isNotEmpty) {
        exhibit.animals.add(animal);
        
      } 
    }
  }
}


 void updateFeedingSchedule(String animalName, String time,
    {required String foodType, required String quantity}) {
  FeedingSchedule? schedule = feedingSchedules.firstWhere(
    (schedule) => schedule.animalName == animalName && schedule.time == time,
 
  ) as FeedingSchedule?;

  if (schedule != null) {
    schedule.foodType = foodType;
    schedule.quantity = quantity;
    
  } 
}




  void displayAllAnimals() {
    print('Details of all Animals :');
    for (Animal animal in animals) {
      animal.displayDetails();
    }
    print('\n');
  }

  void displayExhibits() {
    print('Details of all Exhibits :');
    for (Exhibit exhibit in exhibits) {
      exhibit.displayDetails();
    }
    print('\n');
  }

  void displayFeedingSchedule() {
    print('Details of all Feeding Schedule : ');
    for (FeedingSchedule schedule in feedingSchedules) {
      print('${schedule.animalName} - ${schedule.time} - ${schedule.foodType} - ${schedule.quantity}');
    }
    print('\n');
  }

  void displayVisitors() {
    print('Details of all Visitors :');
    for (Visitor visitor in visitors) {
      print('${visitor.name} (Age: ${visitor.age}) - Visited Exhibits: ${visitor.visitedExhibits}');
    }
  }
}

class Visitor {
  String name;
  int age;
  List<String> visitedExhibits = [];

  Visitor({required this.name, required this.age});

  void visitExhibit(Zoo zoo, String exhibitName) {
    visitedExhibits.add(exhibitName);
    zoo.addVisitor(this);
    
  }
}

void main() {
  Zoo myZoo = Zoo();

  myZoo.addAnimal(Lion(name: 'Simba', age: '5'));
  myZoo.addAnimal(Giraffe(name: 'Gerald', age: '3'));

  myZoo.addExhibit(InteractiveExhibit(name: 'Savannah Exhibit'));
  //added
  myZoo.addExhibit(StaticExhibit(name: 'General Exhibit'));
  
  myZoo.addExhibit(StaticExhibit(name: 'Rainforest Exhibit'));

  myZoo.addFeedingSchedule('Simba', '10:00 AM', foodType: 'Meat', quantity: '2 kg');
  myZoo.addFeedingSchedule('Gerald', '12:30 PM', foodType: 'Leaves', quantity: '5 kg');
   
  
  //added
  myZoo.moveAnimalToExhibit('Simba', 'General Exhibit');
  
  myZoo.transferAnimal('Simba', 'General Exhibit', 'Savannah Exhibit');

  myZoo.moveAnimalToExhibit('Gerald', 'Rainforest Exhibit');

  myZoo.updateFeedingSchedule('Simba', '10:00 AM', foodType: 'Meat', quantity: '3 kg');

  Visitor johnDoe = Visitor(name: 'John Doe', age: 25);
  johnDoe.visitExhibit(myZoo, 'Savannah Exhibit');

  myZoo.displayAllAnimals();
  myZoo.displayExhibits();
  myZoo.displayFeedingSchedule();
  myZoo.displayVisitors();
}