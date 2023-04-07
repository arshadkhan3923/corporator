class VendorDataTableModel {
  final String? id, name, typename,userId,  action;

  VendorDataTableModel(
      { this.id,this.name, this.typename,this.userId,  this.action});
}

List vendorModel = [
  VendorDataTableModel(
    id: '01',
    name: "John Mosley",
    userId:'74',
    typename: "single",
    action: "Edit",
  ),
  VendorDataTableModel(
    id: '02',
    name: "Olive Yew",
    userId:'20',
    typename: "Married",
    action: "Edit",
  ),
  VendorDataTableModel(
    id: '03',
    name: "Teri Dactyl",
    userId:'74',
    typename: "single",
    action: "Edit",
  ),
  VendorDataTableModel(
    id: '04',
    name: "Teri Dactyl",
    userId:'84',
    typename: "single",
    action: "Edit",
  ),
  VendorDataTableModel(
    id: '05',
    name: "Peg Legged",
    userId:'35',
    typename: "Married",
    action: "Edit",
  ),
  VendorDataTableModel(
    id: '06',
    name: "Allie Grate",
    userId:'45',
    typename: "Married",
    action: "Edit",
  ),
  VendorDataTableModel(
    id: '07',
    name: "Teri Dactyl",
    userId:'78',
    typename: "Single",
    action: "Edit",
  ),
  VendorDataTableModel(
    id: '08',
    name: "Allie Grate",
    userId:'67',
    typename: "Single",
    action: "Edit",
  ),
  VendorDataTableModel(
    id: '09',
    name: "Olive Yew",
    userId:'83',
    typename: "Married",
    action: "Edit",
  ),
  VendorDataTableModel(
    id: '10',
    name: "Olive Yew",
    userId:'90',
    typename: "Single",
    action: "Edit",
  ),



];
