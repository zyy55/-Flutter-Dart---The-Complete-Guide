import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../providers/product.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/edit-product';

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageUriController = TextEditingController();
  final _imageUriFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  var _editProduct = Product(
    id: null,
    title: '',
    description: '',
    price: 0,
    imageUrl: '',
  );

  @override
  void initState() {
    _imageUriFocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  @override
  void dispose() {
    _imageUriFocusNode.removeListener(_updateImageUrl);
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageUriController.dispose();
    _imageUriFocusNode.dispose();
    super.dispose();
  }

  void _updateImageUrl() {
    if (!_imageUriFocusNode.hasFocus) {
      setState(() {});
    }
  }

  void _saveForm() {
    //save that form
    _form.currentState.save();
    print(_editProduct.title);
    print(_editProduct.description);
    print(_editProduct.price);
    print(_editProduct.imageUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveForm,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              //labelText = hintText
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceFocusNode);
                },
                onSaved: (value) {
                  _editProduct = Product(
                    title: value,
                    price: _editProduct.price,
                    description: _editProduct.description,
                    imageUrl: _editProduct.imageUrl,
                    id: null,
                  );
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Price'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _priceFocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_descriptionFocusNode);
                },
                onSaved: (value) {
                  _editProduct = Product(
                    title: _editProduct.title,
                    price: double.parse(value),
                    description: _editProduct.description,
                    imageUrl: _editProduct.imageUrl,
                    id: null,
                  );
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                focusNode: _descriptionFocusNode,
                onSaved: (value) {
                  _editProduct = Product(
                    title: _editProduct.title,
                    price: _editProduct.price,
                    description: value,
                    imageUrl: _editProduct.imageUrl,
                    id: null,
                  );
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(
                      top: 8,
                      right: 10,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.grey,
                      ),
                    ),
                    child: _imageUriController.text.isEmpty
                        ? Text('Enter a URL')
                        : FittedBox(
                            child: Image.network(
                              _imageUriController.text,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                  Expanded(
                      child: TextFormField(
                    decoration: InputDecoration(labelText: 'Image URL'),
                    keyboardType: TextInputType.url,
                    //if it's not the last textFormFiel we need to write
                    //textInputAction: TextInputAction.next,
                    textInputAction: TextInputAction.done,
                    controller: _imageUriController,
                    //If you change the field, it will save the image alone
                    focusNode: _imageUriFocusNode,
                    onFieldSubmitted: (_) {
                      _saveForm();
                    },
                    onSaved: (value) {
                      _editProduct = Product(
                        title: _editProduct.title,
                        price: _editProduct.price,
                        description: _editProduct.description,
                        imageUrl: value,
                        id: null,
                      );
                    },
                    onEditingComplete: () {
                      setState(() {});
                    },
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
