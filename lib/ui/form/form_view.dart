import 'package:atlan_demo/core/base/base_view.dart';
import 'package:atlan_demo/core/models/response_model.dart';
import 'package:atlan_demo/ui/form/form_view_model.dart';
import 'package:atlan_demo/widgets/custom_scaffold.dart';
import 'package:atlan_demo/widgets/mapped_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ResponseModel<Map<String, dynamic>> responseModel =
        Provider.of<ResponseModel<Map<String, dynamic>>>(context);

    FormViewModel viewModel = FormViewModel(
        utilityServices: Provider.of(context),
        formMapList: responseModel.data.containsKey('fields')
            ? List.castFrom(responseModel.data['fields'])
            : []);
    return BaseView<FormViewModel>(
      viewModel: viewModel,
      onModelReady: (viewModel) {
        viewModel.formMapList.forEach((response) {
          GlobalKey<MappedWidgetState> key = GlobalKey();
          viewModel.responseList.add({'key': key});
          viewModel.addToMappedList(MappedWidget.fromMap(response));
          viewModel.refresh();
        });
      },
      builder: (context, viewModel, _) {
        return _getView(context, viewModel);
      },
    );
  }

  Widget _getView(BuildContext context, FormViewModel viewModel) {
    return CustomScaffold(
      appBar: AppBar(
        title: Text('Survey'),
      ),
      body: Center(
        child: viewModel.widgetList.length > 0
            ? viewModel.widgetList.elementAt(viewModel.formElementIndex)
            : Offstage(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: viewModel.save,
        label: Text('Save'),
      ),
    );
  }
}
