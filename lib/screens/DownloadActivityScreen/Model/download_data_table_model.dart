class DownloadActivityModel {
  final String? image, name, typename, uploadData, size, action;

  DownloadActivityModel(
      { this.image,this.name, this.typename, this.uploadData, this.size, this.action});
}

List downloadUsers = [
  DownloadActivityModel(
    image: "assets/icons/Document_2_icon.png",
    name: "Flutter Apps",
    size: "Software Architect",
    action: "View",
    typename: "Folder",
    uploadData: "01/02/2023",
  ),
  DownloadActivityModel(
    image: "assets/icons/Document_2_icon.png",
    name: "Apps",
    typename: "Document",
    size: "Standard",
    uploadData: "02-02-2023",
    action: "View",
  ),
  DownloadActivityModel(
    image: "assets/icons/Document_2_icon.png",
    name: "Dactyl",
    typename: "Folder",
    size: "Standard",
    uploadData: "03-02-2023",
    action: "View",
  ),
  DownloadActivityModel(
    image: "assets/icons/Document_2_icon.png",
    name: "Peg Legged",
    typename: "Video",
    size: "Project Manager",
    uploadData: "03-02-2023",
    action: "View",

  ),
  DownloadActivityModel(
    image: "assets/icons/Document_2_icon.png",
    name: "Allie Grate",
    typename: "Document",
    size: "Premium",
    uploadData: "04-02-2023",
    action: "view",
  ),
  DownloadActivityModel(
    image: "assets/icons/Document_2_icon.png",
    name: "Teri Dactyl",
    typename: "Video",
    size: "Basic",
    uploadData: "25-02-2021",
    action: "View",


  ),
  DownloadActivityModel(
    image: "assets/icons/Document_2_icon.png",
    name: "Allie Grate",
    typename: "PNG File",
    size: "Premium",
    uploadData: "05-02-2023",
    action: "View",
  ),
  DownloadActivityModel(
    image: "assets/icons/Document_2_icon.png",
    name: "Faded",
    typename: "Folder",
    size: "Basic",
    uploadData: "06-02-2023",
    action: "View",
  ),
  DownloadActivityModel (
    image: "assets/icons/Document_2_icon.png",
    name: "Figma Logo",
    typename: "PNG File",
    size: "Standard",
    uploadData: "25-02-2021",
    action: "View",
  ),
];
