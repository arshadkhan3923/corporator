class UploadActivityModel {
  final String? image, name, typename, uploadData, size, action;

  UploadActivityModel(
      { this.image,this.name, this.typename, this.uploadData, this.size, this.action});
}

List uploadUsers = [
  UploadActivityModel(
    image: "assets/icons/Document_2_icon.png",
    name: "Flutter Apps",
    size: "Software Architect",
    action: "View",
    typename: "Folder",
    uploadData: "01/02/2023",
  ),
  UploadActivityModel(
    image: "assets/icons/Document_2_icon.png",
    name: "Apps",
    typename: "Document",
    size: "Standard",
    uploadData: "02-02-2023",
    action: "View",
  ),
  UploadActivityModel(
    image: "assets/icons/Document_2_icon.png",
    name: "Dactyl",
    typename: "Folder",
    size: "Standard",
    uploadData: "03-02-2023",
    action: "View",
  ),
  UploadActivityModel(
    image: "assets/icons/Document_2_icon.png",
    name: "Peg Legged",
    typename: "Video",
    size: "Project Manager",
    uploadData: "03-02-2023",
    action: "View",

  ),
  UploadActivityModel(
    image: "assets/icons/Document_2_icon.png",
    name: "Allie Grate",
    typename: "Document",
    size: "Premium",
    uploadData: "04-02-2023",
    action: "view",
  ),
  UploadActivityModel(
    image: "assets/icons/Document_2_icon.png",
    name: "Teri Dactyl",
    typename: "Video",
    size: "Basic",
    uploadData: "25-02-2021",
    action: "View",


  ),
  UploadActivityModel(
    image: "assets/icons/Document_2_icon.png",
    name: "Allie Grate",
    typename: "PNG File",
    size: "Premium",
    uploadData: "05-02-2023",
    action: "View",
  ),
  UploadActivityModel(
    image: "assets/icons/Document_2_icon.png",
    name: "Faded",
    typename: "Folder",
    size: "Basic",
    uploadData: "06-02-2023",
    action: "View",
  ),
  UploadActivityModel (
    image: "assets/icons/Document_2_icon.png",
    name: "Figma Logo",
    typename: "PNG File",
    size: "Standard",
    uploadData: "25-02-2021",
    action: "View",
  ),
];
