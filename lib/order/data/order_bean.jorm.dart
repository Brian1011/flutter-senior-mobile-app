// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_bean.dart';

// **************************************************************************
// BeanGenerator
// **************************************************************************

abstract class _OrderBean implements Bean<Order> {
  final id = IntField('id');
  final pickUpAddress = StrField('pick_up_address');
  final dropOffAddress = StrField('drop_off_address');
  final weight = StrField('weight');
  final deliveryInstructions = StrField('delivery_instructions');
  Map<String, Field> _fields;
  Map<String, Field> get fields => _fields ??= {
        id.name: id,
        pickUpAddress.name: pickUpAddress,
        dropOffAddress.name: dropOffAddress,
        weight.name: weight,
        deliveryInstructions.name: deliveryInstructions,
      };
  Order fromMap(Map map) {
    Order model = Order();
    model.id = adapter.parseValue(map['id']);
    model.pickUpAddress = adapter.parseValue(map['pick_up_address']);
    model.dropOffAddress = adapter.parseValue(map['drop_off_address']);
    model.weight = adapter.parseValue(map['weight']);
    model.deliveryInstructions =
        adapter.parseValue(map['delivery_instructions']);

    return model;
  }

  List<SetColumn> toSetColumns(Order model,
      {bool update = false, Set<String> only, bool onlyNonNull = false}) {
    List<SetColumn> ret = [];

    if (only == null && !onlyNonNull) {
      if (model.id != null) {
        ret.add(id.set(model.id));
      }
      ret.add(pickUpAddress.set(model.pickUpAddress));
      ret.add(dropOffAddress.set(model.dropOffAddress));
      ret.add(weight.set(model.weight));
      ret.add(deliveryInstructions.set(model.deliveryInstructions));
    } else if (only != null) {
      if (model.id != null) {
        if (only.contains(id.name)) ret.add(id.set(model.id));
      }
      if (only.contains(pickUpAddress.name))
        ret.add(pickUpAddress.set(model.pickUpAddress));
      if (only.contains(dropOffAddress.name))
        ret.add(dropOffAddress.set(model.dropOffAddress));
      if (only.contains(weight.name)) ret.add(weight.set(model.weight));
      if (only.contains(deliveryInstructions.name))
        ret.add(deliveryInstructions.set(model.deliveryInstructions));
    } else /* if (onlyNonNull) */ {
      if (model.id != null) {
        ret.add(id.set(model.id));
      }
      if (model.pickUpAddress != null) {
        ret.add(pickUpAddress.set(model.pickUpAddress));
      }
      if (model.dropOffAddress != null) {
        ret.add(dropOffAddress.set(model.dropOffAddress));
      }
      if (model.weight != null) {
        ret.add(weight.set(model.weight));
      }
      if (model.deliveryInstructions != null) {
        ret.add(deliveryInstructions.set(model.deliveryInstructions));
      }
    }

    return ret;
  }

  Future<void> createTable({bool ifNotExists = false}) async {
    final st = Sql.create(tableName, ifNotExists: ifNotExists);
    st.addInt(id.name, primary: true, autoIncrement: true, isNullable: false);
    st.addStr(pickUpAddress.name, isNullable: true);
    st.addStr(dropOffAddress.name, isNullable: true);
    st.addStr(weight.name, isNullable: true);
    st.addStr(deliveryInstructions.name, isNullable: true);
    return adapter.createTable(st);
  }

  Future<dynamic> insert(Order model,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    final Insert insert = inserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
        .id(id.name);
    var retId = await adapter.insert(insert);
    if (cascade) {
      Order newModel;
    }
    return retId;
  }

  Future<void> insertMany(List<Order> models,
      {bool onlyNonNull = false, Set<String> only}) async {
    final List<List<SetColumn>> data = models
        .map((model) =>
            toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
        .toList();
    final InsertMany insert = inserters.addAll(data);
    await adapter.insertMany(insert);
    return;
  }

  Future<dynamic> upsert(Order model,
      {bool cascade = false,
      Set<String> only,
      bool onlyNonNull = false,
      isForeignKeyEnabled = false}) async {
    var retId;
    if (isForeignKeyEnabled) {
      final Insert insert = Insert(tableName, ignoreIfExist: true)
          .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
      retId = await adapter.insert(insert);
      if (retId == null) {
        final Update update = updater
            .where(this.id.eq(model.id))
            .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
        retId = adapter.update(update);
      }
    } else {
      final Upsert upsert = upserter
          .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
          .id(id.name);
      retId = await adapter.upsert(upsert);
    }
    if (cascade) {
      Order newModel;
    }
    return retId;
  }

  Future<void> upsertMany(List<Order> models,
      {bool onlyNonNull = false,
      Set<String> only,
      isForeignKeyEnabled = false}) async {
    final List<List<SetColumn>> data = [];
    for (var i = 0; i < models.length; ++i) {
      var model = models[i];
      data.add(
          toSetColumns(model, only: only, onlyNonNull: onlyNonNull).toList());
    }
    final UpsertMany upsert = upserters.addAll(data);
    await adapter.upsertMany(upsert);
    return;
  }

  Future<int> update(Order model,
      {bool cascade = false,
      bool associate = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Update update = updater
        .where(this.id.eq(model.id))
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.update(update);
  }

  Future<void> updateMany(List<Order> models,
      {bool onlyNonNull = false, Set<String> only}) async {
    final List<List<SetColumn>> data = [];
    final List<Expression> where = [];
    for (var i = 0; i < models.length; ++i) {
      var model = models[i];
      data.add(
          toSetColumns(model, only: only, onlyNonNull: onlyNonNull).toList());
      where.add(this.id.eq(model.id));
    }
    final UpdateMany update = updaters.addAll(data, where);
    await adapter.updateMany(update);
    return;
  }

  Future<Order> find(int id,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.id.eq(id));
    return await findOne(find);
  }

  Future<int> remove(int id) async {
    final Remove remove = remover.where(this.id.eq(id));
    return adapter.remove(remove);
  }

  Future<int> removeMany(List<Order> models) async {
// Return if models is empty. If this is not done, all records will be removed!
    if (models == null || models.isEmpty) return 0;
    final Remove remove = remover;
    for (final model in models) {
      remove.or(this.id.eq(model.id));
    }
    return adapter.remove(remove);
  }
}
