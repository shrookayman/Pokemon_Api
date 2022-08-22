class Pokemon {
  final int _id;
  final String? _num;
  final String? _name;
  final String? _img;
  final List _type;
  final String? _height;
  final String? _weight;
  final List _weaknesses;
  final String? _candy;
  // final int _candy_count;

  Pokemon(
      this._id, this._num, this._name, this._img, this._type, this._height, this._weight, this._weaknesses, this._candy


      );
   get id => _id;
   get num => _num;

   get name => _name;


   // get candy_count => _candy_count;

   get candy => _candy;

   get weaknesses => _weaknesses;

   get weight => _weight;

   get height => _height;

   get type => _type;

   get img => _img;
}

class SmallPokemonCard {
  final String _name;
  final String _img;

  SmallPokemonCard(this._name, this._img);

  get name => _name;
  get img => _img;
}