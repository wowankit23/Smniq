class Slots {
  String slotST;
  String slotET;
  List<ChildSlots> childSlots;

  Slots({this.slotST, this.slotET, this.childSlots});

  Slots.fromJson(Map<String, dynamic> json) {
    slotST = json['slotST'];
    slotET = json['slotET'];
    if (json['childSlots'] != null) {
      childSlots = new List<ChildSlots>();
      json['childSlots'].forEach((v) {
        childSlots.add(new ChildSlots.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slotST'] = this.slotST;
    data['slotET'] = this.slotET;
    if (this.childSlots != null) {
      data['childSlots'] = this.childSlots.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChildSlots {
  String sT;
  String eT;
  int filled;
  String fillStatus;

  ChildSlots({this.sT, this.eT, this.filled, this.fillStatus});

  ChildSlots.fromJson(Map<String, dynamic> json) {
    sT = json['ST'];
    eT = json['ET'];
    filled = json['filled'];
    fillStatus = json['fillStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ST'] = this.sT;
    data['ET'] = this.eT;
    data['filled'] = this.filled;
    data['fillStatus'] = this.fillStatus;
    return data;
  }
}
