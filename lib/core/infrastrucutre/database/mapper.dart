

import 'value_objects.dart';

abstract class DatabaseMapper<D,P extends DatabaseEntity> {
  D toDomainEntity(P persistance);
  P toPersistanceEntity(D domain); 
} 