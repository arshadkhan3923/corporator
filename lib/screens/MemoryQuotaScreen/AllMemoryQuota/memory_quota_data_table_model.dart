class MemoryQuotaDataTableModel {
  final String? id, maxSpace, userId, packageId, action;

  MemoryQuotaDataTableModel(
      { this.id,this.maxSpace, this.userId,this.packageId,  this.action});
}

List memoryQuotaModel = [
  MemoryQuotaDataTableModel(
    id: '01',
    maxSpace: "10 GB",
    userId: "53",
    packageId: '04',
    action: "Edit",
  ),
  MemoryQuotaDataTableModel(
    id: '02',
    maxSpace: "15 GB",
    userId: "8",
    packageId: '04 ',
    action: "Edit",
  ),
  MemoryQuotaDataTableModel(
    id: '03',
    maxSpace: "12 GB",
    userId: "33",
    packageId: '10',
    action: "Edit",
  ),
  MemoryQuotaDataTableModel(
    id: '04',
    maxSpace: "10 GB",
    userId: "20",
    packageId: '04',
    action: "Edit",
  ),
  MemoryQuotaDataTableModel(
    id: '05',
    maxSpace: "15 GB",
    userId: "07",
    packageId: '54',
    action: "Edit",
  ),
  MemoryQuotaDataTableModel(
    id: '06',
    maxSpace: "12 GB",
    userId: "9",
    packageId: '34',
    action: "Edit",
  ),
  MemoryQuotaDataTableModel(
    id: '07',
    maxSpace: "10 GB",
    userId: "5",
    packageId: '89',
    action: "Edit",
  ),
  MemoryQuotaDataTableModel(
    id: '08',
    maxSpace: "15 GB",
    userId: "03",
    packageId: '78',
    action: "Edit",
  ),
  MemoryQuotaDataTableModel(
    id: '09',
    maxSpace: "12 GB",
    userId: "03",
    packageId: '67',
    action: "Edit",
  ),


];
