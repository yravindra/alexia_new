// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alexia/modules/theme.dart';

// Project imports:
import 'package:reactive_dropdown_search/reactive_dropdown_search.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../interface/option.dart';

class OptionDropdown extends StatelessWidget {
  final DropdownSearchOnFind<Option>? onSearch;
  final String? label;
  final BeforeChange<Option?>? onChanged;
  final List<Option>? optionList;
  final bool isFilteredOnline;
  final bool showClearButton;
  final bool showSearchBox;
  final double? dialogHeight;
  final Mode dialogMode;
  final Color borderColor;
  final double borderRadius;
  final String? searchHint;
  final String? formControlName;
  final FormControl<Option>? formControl;
  final Widget? prefixIcon;

  const OptionDropdown({
    Key? key,
    this.onSearch,
    this.label,
    this.onChanged,
    this.optionList,
    this.isFilteredOnline = true,
    this.showClearButton = false,
    this.showSearchBox = false,
    this.borderColor = const Color(0xff778088),
    this.dialogHeight,
    this.dialogMode = Mode.BOTTOM_SHEET,
    this.searchHint = "Type to search...",
    this.borderRadius = 5.0,
    this.formControlName,
    this.formControl,
    this.prefixIcon,
  }) : super(key: key);

  Widget _customDropDown(
    BuildContext context,
    Option? item,
  ) {
    if (item == null) {
      return Container();
    }

    return Text(
      item.catName,
      textScaleFactor: 1.0,
      maxLines: 1,
      textAlign: TextAlign.left,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: descriptionColor,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _customPopupItemBuilder(
    BuildContext context,
    Option? item,
    bool isSelected,
  ) {
    if (item == null) {
      return Container();
    }

    return Material(
      type: MaterialType.transparency,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(15.h),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                item.catName,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: descriptionColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder _outlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: borderColor.withOpacity(0.6), width: 1.0),
      borderRadius: BorderRadius.circular(borderRadius),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveDropdownSearch<Option, Option>(
      formControlName: formControlName,
      formControl: formControl,
      asyncItems: onSearch,
      onBeforeChange: onChanged,
      items: optionList ?? [],
      showClearButton: showClearButton,
      itemAsString: (Option? option) => option!.catName,
      clearButtonProps: ClearButtonProps(
        icon: Icon(
          Icons.clear,
          size: 15.w,
        ),
      ),
      dropdownButtonProps: DropdownButtonProps(
        icon: Icon(
          Icons.arrow_drop_down,
          size: 15.w,
        ),
      ),
      dropdownSearchTextStyle: TextStyle(
        color: Theme.of(context).primaryColorDark,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          labelText: label,
          fillColor: Theme.of(context).backgroundColor,
          floatingLabelStyle: TextStyle(
            color: Theme.of(context).primaryColorDark,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
          labelStyle: TextStyle(
            color: descriptionColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
          focusedBorder: _outlineInputBorder(),
          border: _outlineInputBorder(),
          enabledBorder: _outlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 10.h),
          prefixIcon: prefixIcon,
        ),
      ),
      popupProps: buildPopupProps(dialogMode, context),
    );
  }

  PopupProps<Option> buildPopupProps(Mode dialogMode, BuildContext context) {
    if (dialogMode == Mode.BOTTOM_SHEET) {
      return PopupProps.modalBottomSheet(
        showSearchBox: showSearchBox,
        isFilterOnline: isFilteredOnline,
        itemBuilder: _customPopupItemBuilder,
        searchFieldProps: TextFieldProps(
          style: TextStyle(
            color: titleColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            hintText: searchHint,
            prefixIcon: Icon(
              Icons.search,
              color: Theme.of(context).primaryColorDark,
            ),
          ),
        ),
        modalBottomSheetProps: const ModalBottomSheetProps(
          backgroundColor: navBarBackgroundColor,
          useRootNavigator: true,
        ),
        // textStyle: TextStyle(
        //   color: descriptionColor,
        //   fontSize: 14.sp,
        //   fontWeight: FontWeight.w500,
        // ),
      );
    }

    return PopupProps.menu(
      showSearchBox: showSearchBox,
      isFilterOnline: isFilteredOnline,
      itemBuilder: _customPopupItemBuilder,
      searchFieldProps: TextFieldProps(
        style: TextStyle(
          color: descriptionColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          hintText: searchHint,
          prefixIcon: Icon(
            Icons.search,
            color: Theme.of(context).primaryColorDark,
          ),
        ),
      ),
      menuProps: MenuProps(
        backgroundColor: navBarBackgroundColor,
        // textStyle: TextStyle(
        //   color: descriptionColor,
        //   fontSize: 15.sp,
        //   fontWeight: FontWeight.w500,
        // ),
      ),
      // textStyle: TextStyle(
      //   color: descriptionColor,
      //   fontSize: 14.sp,
      //   fontWeight: FontWeight.w500,
      // ),
    );
  }
}
