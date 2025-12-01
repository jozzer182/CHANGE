import 'package:chango/changeorder/model/changeorder_model.dart';
import 'package:chango/resources/toCurrency.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:universal_html/html.dart' as html;
import 'package:printing/printing.dart';
import 'package:flutter/services.dart' show rootBundle;

Future generatePdf({
  required ChangeOrder changeOrder,
  required bool isX,
}) async {
  toResult(String valor) {
    if (isX) {
      if (valor == "true") {
        return "X";
      } else {
        return "";
      }
    }
    if (valor == "true") {
      return "YES";
    } else {
      return "NO";
    }
  }

  final font1 = await PdfGoogleFonts.openSansRegular();
  // final font2 = await PdfGoogleFonts.openSansItalic();

  final profileImage = MemoryImage(
    (await rootBundle.load('images/enel_logo.png')).buffer.asUint8List(),
  );

  final clasificationImage = MemoryImage(
    (await rootBundle.load('images/category.png')).buffer.asUint8List(),
  );

  Document doc = Document(
      title:
          '${changeOrder.id} - ${changeOrder.suppliername} - ${changeOrder.idelectronicsignaturetool}',
      producer: 'ChanGE App');
  doc.addPage(
    Page(
      pageFormat: PdfPageFormat.a4.copyWith(
        marginBottom: 32,
        marginLeft: 32,
        marginRight: 32,
        marginTop: 32,
      ),
      theme: ThemeData.withFont(
        base: font1,
      ),
      build: (context) {
        return Container(
          decoration: BoxDecoration(border: Border.all()),
          padding: const EdgeInsets.all(4),
          // constraints: BoxConstraints(maxWidth: 600),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Organizational Procedures',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 9,
                              ),
                            ),
                            const TextSpan(
                              text: ' no.39 - ANNEX 1',
                              style: TextStyle(
                                fontSize: 9,
                              ),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Global Infrastructure and Networks, ',
                              style: TextStyle(
                                fontSize: 7,
                              ),
                            ),
                            TextSpan(
                              text: ' Change Order Management',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 7,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        height: 32,
                        child: Image(profileImage),
                      )
                    ],
                  ),
                  Spacer(),
                  SizedBox(
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 2),
                        CampoFormulario(
                          title: 'Responsability area',
                          text: changeOrder.responsabilityarea,
                          widthField: 200,
                          widthContainer: 100,
                        ),
                        SizedBox(height: 2),
                        CampoFormulario(
                          title: 'Request type',
                          text: changeOrder.requesttype,
                          widthField: 200,
                          widthContainer: 100,
                        ),
                        SizedBox(height: 2),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Id. electronic signature tool',
                                style: const TextStyle(fontSize: 8),
                                overflow: TextOverflow.clip,
                              ),
                              TextField(
                                width: 60,
                                name: 'Change order number',
                                value: changeOrder.idelectronicsignaturetool,
                                textStyle: const TextStyle(fontSize: 8),
                              ),
                            ]),
                        SizedBox(height: 2),
                        // CampoFormulario(
                        //   title: 'Id. electronic signature tool',
                        //   text: changeOrder.idelectronicsignaturetool,
                        //   widthField: 200,
                        //   widthContainer: 60,
                        // ),
                        // SizedBox(height: 2),
                        CampoFormulario(
                          title: 'Local id. code',
                          text: changeOrder.localidcode,
                          widthField: 200,
                          widthContainer: 60,
                        ),
                        SizedBox(height: 2),
                        CampoFormulario(
                          title: 'Date',
                          text: changeOrder.date,
                          widthField: 200,
                          widthContainer: 60,
                        ),
                        SizedBox(height: 2),
                      ],
                    ),
                  ),
                  SizedBox(width: 16),
                ],
              ),
              SizedBox(height: 16),
              Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.all(4),
                // margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(color: PdfColors.grey600),
                ),
                child: Column(
                  children: [
                    Text(
                      'General information of the contract',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 8,
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 250,
                          alignment: Alignment.topCenter,
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            border: Border.all(color: PdfColors.grey300),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Local',
                                    style: TextStyle(
                                      color: PdfColors.grey,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 8,
                                    ),
                                  ),
                                  Spacer(),
                                  CampoFormulario(
                                    title: 'Area',
                                    text: changeOrder.area,
                                    widthField: 115,
                                    widthContainer: 80,
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  CampoFormulario(
                                    title: 'Country',
                                    text: changeOrder.country,
                                    widthField: 115,
                                    widthContainer: 80,
                                  ),
                                  Spacer(),
                                  CampoFormulario(
                                    title: 'Region',
                                    text: changeOrder.region,
                                    widthField: 115,
                                    widthContainer: 80,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(
                          width: 250,
                          alignment: Alignment.topCenter,
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            border: Border.all(color: PdfColors.grey300),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Global ',
                                    style: TextStyle(
                                      color: PdfColors.grey,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 8,
                                    ),
                                  ),
                                  Text(
                                    '(only for the Global Function Contracts)',
                                    style: TextStyle(
                                      color: PdfColors.grey,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 6,
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  CampoFormulario(
                                    title: 'Unit',
                                    text: changeOrder.unit,
                                    widthField: 200,
                                    widthContainer: 160,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        CampoFormulario(
                          title: 'Contract code',
                          text: changeOrder.contractcode,
                          widthField: 160,
                          widthContainer: 80,
                        ),
                        Spacer(),
                        CampoFormulario(
                          title: 'Contract awarded by direct awarding',
                          text: toResult(changeOrder.contracawardedbydirectawarding),
                          widthField: 200,
                          widthContainer: 40,
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        CampoFormulario(
                          title: 'Supplier code',
                          text: changeOrder.suppliercode,
                          widthField: 160,
                          widthContainer: 80,
                        ),
                        Spacer(),
                        CampoFormulario(
                          title: 'Suplier name',
                          text: changeOrder.suppliername,
                          widthField: 200 + 135,
                          widthContainer: 120 + 150,
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        CampoFormulario(
                          title: 'MG',
                          text: changeOrder.mg,
                          widthField: 120,
                          widthContainer: 80,
                        ),
                        Spacer(),
                        CampoFormulario(
                          title: 'MG description',
                          text: changeOrder.mgdescription,
                          widthField: 380,
                          widthContainer: 300,
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        CampoFormulario(
                          title: 'Object of the contract:',
                          text: changeOrder.objectofthecontract,
                          widthField: 515,
                          widthContainer: 380,
                          heightContainer: 24,
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CampoFormulario(
                          title: 'Contract start date',
                          text: changeOrder.contractstartdate,
                          widthField: 140,
                          widthContainer: 60,
                        ),
                        // Spacer(),
                        CampoFormulario(
                          title: 'Contract end date',
                          text: changeOrder.contractenddate,
                          widthField: 140,
                          widthContainer: 60,
                        ),
                        // Spacer(),
                        CampoFormulario(
                          title: 'Total months',
                          text: changeOrder.totalmonths,
                          widthField: 100,
                          widthContainer: 40,
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CampoFormulario(
                          title: 'Amount of the contract',
                          text: toCurrency$(changeOrder.amountofthecontract),
                          widthField: 180,
                          widthContainer: 60,
                        ),
                        SizedBox(width: 16),
                        CampoFormulario(
                          title: 'Euro',
                          text:
                              toCurrencyEU(changeOrder.amountofthecontracteuro),
                          widthField: 85,
                          widthContainer: 60,
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CampoFormulario(
                          title: 'Residual amount',
                          text: toCurrency$(changeOrder.residualamount),
                          widthField: 180,
                          widthContainer: 60,
                        ),
                        SizedBox(width: 16),
                        CampoFormulario(
                          title: 'Euro',
                          text: toCurrencyEU(changeOrder.residualamounteuro),
                          widthField: 85,
                          widthContainer: 60,
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CampoFormulario(
                          title: 'Option and tolerance already activated',
                          text:
                              toResult(changeOrder.optionandtolerancealreadyactivated),
                          widthField: 200,
                          widthContainer: 40,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.all(4),
                // margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(color: PdfColors.grey600),
                ),
                child: Column(
                  children: [
                    Text(
                      'Forecast on the next contract (if any)',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 8,
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CampoFormulario(
                          title: 'New contract already planned',
                          text: toResult(changeOrder.newcontractalreadyplanned) ,
                          widthField: 200,
                          widthContainer: 40,
                        ),
                        CampoFormulario(
                          title: 'Purchase request code',
                          text: changeOrder.purchasedrequestcode,
                          widthField: 200,
                          widthContainer: 60,
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CampoFormulario(
                          title: 'Smart planning tool requirement id',
                          text: changeOrder.smartplanningtoolrequirementid,
                          widthField: 200,
                          widthContainer: 40,
                        ),
                        CampoFormulario(
                          title: 'PR release date (D 0)',
                          text: changeOrder.prrelasedate,
                          widthField: 200,
                          widthContainer: 60,
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CampoFormulario(
                          title: 'Contract availability date (D11- SAP)',
                          text: changeOrder.contractavailabilitydate,
                          widthField: 200,
                          widthContainer: 40,
                        ),
                        CampoFormulario(
                          title: 'Contractor setup for TCA period (Months)',
                          text: changeOrder.contractorsetupfortcaperiod,
                          widthField: 200,
                          widthContainer: 40,
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CampoFormulario(
                          title: 'Note to next contract status',
                          text: changeOrder.notetonextcontractstatus,
                          widthField: 515,
                          widthContainer: 380,
                          heightContainer: 48,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.all(4),
                // margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(color: PdfColors.grey600),
                ),
                child: Column(
                  children: [
                    Text(
                      'Change Order classification and justification',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 8,
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CampoFormulario(
                          title: 'Number of change order formerly approved',
                          text: changeOrder.numberofchangeorderformerlyapproved,
                          widthField: 250,
                          widthContainer: 40,
                        ),
                        CampoFormulario(
                          title: 'Last CA formerly approved date',
                          text: changeOrder.lastcaformerlyapproveddate,
                          widthField: 250,
                          widthContainer: 60,
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Container(
                      // height: 32,
                      child: Image(clasificationImage),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CampoFormulario(
                          title: 'Reason classification',
                          text: changeOrder.reasonclassification,
                          widthField: 250,
                          widthContainer: 120,
                        ),
                        Text(
                          '(This field does not exclude the compilation of the next field "Reason")',
                          style: const TextStyle(fontSize: 7),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CampoFormulario(
                          title: 'Change order category',
                          text: changeOrder.changeordercategory,
                          widthField: 150,
                          widthContainer: 40,
                        ),
                        CampoFormulario(
                          title: 'Change order level',
                          text: changeOrder.changeorderlevel,
                          widthField: 150,
                          widthContainer: 40,
                        ),
                        CampoFormulario(
                          title: 'Final authorizer',
                          text: changeOrder.finalauthorizer,
                          widthField: 150 + 40,
                          widthContainer: 80 + 40,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    ),
  );

  doc.addPage(
    Page(
      pageFormat: PdfPageFormat.a4.copyWith(
        marginBottom: 32,
        marginLeft: 32,
        marginRight: 32,
        marginTop: 32,
      ),
      theme: ThemeData.withFont(
        base: font1,
      ),
      build: (context) {
        return Container(
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(border: Border.all()),
          padding: const EdgeInsets.all(4),
          child: Column(
            children: [
              Text(
                'Change Order classification and justification',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 8,
                ),
              ),
              SizedBox(height: 16),
              RichText(
                text: TextSpan(
                  text: 'Reason: ',
                  style: TextStyle(
                    fontSize: 8,
                  ),
                  children: [
                    TextSpan(
                      text:
                          '(This field is always mandatory and must be completed by describing in detail the reasons for the request)',
                      style: TextStyle(
                        fontSize: 7,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 4),
              Container(
                height: 715,
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(border: Border.all()),
                padding: const EdgeInsets.all(4),
                child: Column(
                  children: [
                    Paragraph(
                      text: changeOrder.reason,
                      style: const TextStyle(
                        fontSize: 6,
                        color: PdfColors.grey900,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    ),
  );

  doc.addPage(
    Page(
      pageFormat: PdfPageFormat.a4.copyWith(
        marginBottom: 32,
        marginLeft: 32,
        marginRight: 32,
        marginTop: 32,
      ),
      theme: ThemeData.withFont(
        base: font1,
      ),
      build: (context) {
        return Container(
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(border: Border.all()),
          padding: const EdgeInsets.all(4),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.all(4),
                // margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(color: PdfColors.grey600),
                ),
                child: Column(
                  children: [
                    Text(
                      'Change Order amount',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 8,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CampoFormulario(
                          title: 'Extension of amount',
                          text: toResult(changeOrder.extensionofamount) ,
                          widthField: 350,
                          widthContainer: 40,
                        ),
                        Text(
                          '(Fill in below section only if YES)',
                          style: const TextStyle(fontSize: 7),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        CampoFormulario(
                          title: 'Current currency exchange value',
                          text: toCurrencyCOP(
                              changeOrder.currentcurrencyexchangevalue),
                          widthField: 350,
                          widthContainer: 60,
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        CampoFormulario(
                          title: 'Amount of the original contract',
                          text: toCurrency$(
                              changeOrder.amountoftheoriginalcontract),
                          widthField: 350,
                          widthContainer: 60,
                          additionalMessage: "\"A\"  local currency  ",
                        ),
                        SizedBox(width: 8),
                        CampoFormulario(
                          title: 'Euro',
                          text: toCurrencyEU(
                              changeOrder.amountoftheoriginalcontracteuro),
                          widthField: 85,
                          widthContainer: 60,
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        CampoFormulario(
                          title: 'Amount of the extensions formerly approved',
                          text: toCurrency$(
                              changeOrder.amountofextensionsformerlyapproved),
                          widthField: 350,
                          widthContainer: 60,
                          additionalMessage: "\"B\"  local currency  ",
                        ),
                        SizedBox(width: 8),
                        CampoFormulario(
                          title: 'Euro',
                          text: toCurrencyEU(changeOrder
                              .amountofextensionsformerlyapprovedeuro),
                          widthField: 85,
                          widthContainer: 60,
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        CampoFormulario(
                          title: 'Amount of the extension under approva',
                          text: toCurrency$(
                              changeOrder.amountofextensionunderapprova),
                          widthField: 350,
                          widthContainer: 60,
                          additionalMessage: "\"C\"  local currency  ",
                        ),
                        SizedBox(width: 8),
                        CampoFormulario(
                          title: 'Euro',
                          text: toCurrencyEU(
                              changeOrder.amountofextensionunderapprovaeuro),
                          widthField: 85,
                          widthContainer: 60,
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        CampoFormulario(
                          title: 'Change Order amount',
                          text: toCurrency$(changeOrder.changeorderamount),
                          widthField: 350,
                          widthContainer: 60,
                          additionalMessage: "\"A + B + C\"  local currency  ",
                        ),
                        SizedBox(width: 8),
                        CampoFormulario(
                          title: 'Euro',
                          text: toCurrencyEU(changeOrder.changeorderamounteuro),
                          widthField: 85,
                          widthContainer: 60,
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        CampoFormulario(
                          title: '% increase',
                          text: changeOrder.percentageincrease,
                          widthField: 350,
                          widthContainer: 40,
                          additionalMessage: "\"C / (A + B)\"   % ",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 4),
              Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.all(4),
                // margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(color: PdfColors.grey600),
                ),
                child: Column(
                  children: [
                    Text(
                      'Change Order duration',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 8,
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CampoFormulario(
                          title: 'Extension of duration',
                          text: toResult(changeOrder.extensionofduration) ,
                          widthField: 350,
                          widthContainer: 40,
                        ),
                        Text(
                          '(Fill in below section only if YES)',
                          style: const TextStyle(fontSize: 7),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        CampoFormulario(
                          title:
                              'Duration of the original contract (included option)',
                          text: changeOrder.durationoftheoriginalcontract,
                          widthField: 350,
                          widthContainer: 40,
                          additionalMessage: "\"D\"  months  ",
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        CampoFormulario(
                          title: 'Duration of extensions approved formerly',
                          text:
                              changeOrder.durationofextensionsapprovedformerly,
                          widthField: 350,
                          widthContainer: 40,
                          additionalMessage: "\"E\"  months  ",
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        CampoFormulario(
                          title: 'Duration of extension under approval',
                          text: changeOrder.durationofextensionunderapproval,
                          widthField: 350,
                          widthContainer: 40,
                          additionalMessage: "\"F\"  months  ",
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        CampoFormulario(
                          title: 'Change Order duration',
                          text: changeOrder.changeorderduration,
                          widthField: 350,
                          widthContainer: 40,
                          additionalMessage: "\"D + E + F\"  months  ",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 4),
              Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.all(4),
                // margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(color: PdfColors.grey600),
                ),
                child: Column(
                  children: [
                    Text(
                      'Other Supplier Information',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 8,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        CampoFormulario(
                          title:
                              'Supplier qualified for the form of the contract',
                          text:
                              toResult(changeOrder.supplierqualifiedformgofthecontract),
                          widthField: 350,
                          widthContainer: 40,
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        CampoFormulario(
                          title: 'MG High/Medium risk present in the contract',
                          text: toResult(changeOrder.mghighmediumriskpresentinthecontract),
                          widthField: 350,
                          widthContainer: 40,
                        ),
                        SizedBox(width: 8),
                        Text(
                          '(Only for W&S contract)',
                          style: const TextStyle(fontSize: 7),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        CampoFormulario(
                          title: 'Positive evaluation HSEQ',
                          text: toResult(changeOrder.positiveevaluationhseq) ,
                          widthField: 350,
                          widthContainer: 40,
                        ),
                        SizedBox(width: 8),
                        Text(
                          '(Only for W&S contract)',
                          style: const TextStyle(fontSize: 7),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        CampoFormulario(
                          title: 'Note',
                          text: changeOrder.note,
                          widthField: 350 + 160,
                          widthContainer: 280 + 160,
                          heightContainer: 48,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 4),
              Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.all(4),
                // margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(color: PdfColors.grey600),
                ),
                child: Column(
                  children: [
                    Text(
                      'Signature',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 8,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CampoFormulario(
                          title: 'Unit',
                          text: changeOrder.unit1,
                          widthField: 120,
                          widthContainer: 80,
                        ),
                        CampoFormulario(
                          title: 'Name Surname',
                          text: changeOrder.namesurname1,
                          widthField: 200,
                          widthContainer: 110,
                        ),
                        Row(
                          children: [
                            Text(
                              'Electronic signature',
                              style: const TextStyle(fontSize: 8),
                            ),
                            Container(
                              width: 100,
                              height: 12,
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: PdfColors.grey600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CampoFormulario(
                          title: 'Unit',
                          text: changeOrder.unit2,
                          widthField: 120,
                          widthContainer: 80,
                        ),
                        CampoFormulario(
                          title: 'Name Surname',
                          text: changeOrder.namesurname2,
                          widthField: 200,
                          widthContainer: 110,
                        ),
                        Row(
                          children: [
                            Text(
                              'Electronic signature',
                              style: const TextStyle(fontSize: 8),
                            ),
                            Container(
                              width: 100,
                              height: 12,
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: PdfColors.grey600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CampoFormulario(
                          title: 'Unit',
                          text: changeOrder.unit3,
                          widthField: 120,
                          widthContainer: 80,
                        ),
                        CampoFormulario(
                          title: 'Name Surname',
                          text: changeOrder.namesurname3,
                          widthField: 200,
                          widthContainer: 110,
                        ),
                        Row(
                          children: [
                            Text(
                              'Electronic signature',
                              style: const TextStyle(fontSize: 8),
                            ),
                            Container(
                              width: 100,
                              height: 12,
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: PdfColors.grey600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CampoFormulario(
                          title:
                              'Unit Global Supply Chain(W&S or M&E or Log)/E&C-CM',
                          text: changeOrder.unitglobalsccm,
                          widthField: 330,
                          widthContainer: 110,
                        ),
                        Row(
                          children: [
                            Text(
                              'Electronic visa',
                              style: const TextStyle(fontSize: 8),
                            ),
                            Container(
                              width: 100,
                              height: 12,
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: PdfColors.grey600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CampoFormulario(
                          title:
                              'Head of Supply Chain (W&S or M&E or Log)/E&C-CM',
                          text: changeOrder.headofsccm,
                          widthField: 330,
                          widthContainer: 110,
                        ),
                        Row(
                          children: [
                            Text(
                              'Electronic visa',
                              style: const TextStyle(fontSize: 8),
                            ),
                            Container(
                              width: 100,
                              height: 12,
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: PdfColors.grey600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CampoFormulario(
                          title: 'Head of Global Supply Chain',
                          text: changeOrder.headofglobalsccm,
                          widthField: 330,
                          widthContainer: 110,
                        ),
                        Row(
                          children: [
                            Text(
                              'Electronic signature',
                              style: const TextStyle(fontSize: 8),
                            ),
                            Container(
                              width: 100,
                              height: 12,
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: PdfColors.grey600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CampoFormulario(
                          title: 'Head of Global O&M',
                          text: changeOrder.headofglobalomec,
                          widthField: 330,
                          widthContainer: 110,
                        ),
                        Row(
                          children: [
                            Text(
                              'Electronic signature',
                              style: const TextStyle(fontSize: 8),
                            ),
                            Container(
                              width: 100,
                              height: 12,
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: PdfColors.grey600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CampoFormulario(
                          title: 'Head of Enel Grids',
                          text: changeOrder.headofglobalin,
                          widthField: 330,
                          widthContainer: 110,
                        ),
                        Row(
                          children: [
                            Text(
                              'Electronic signature',
                              style: const TextStyle(fontSize: 8),
                            ),
                            Container(
                              width: 100,
                              height: 12,
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: PdfColors.grey600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 4),
              Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(color: PdfColors.grey600),
                ),
                child: Column(
                  children: [
                    Text(
                      'Signatures for global functions contracts',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 8,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CampoFormulario(
                          title: 'Head of relevant global functions',
                          text: changeOrder.headforelevantglobalfunctions,
                          widthField: 330,
                          widthContainer: 110,
                        ),
                        Row(
                          children: [
                            Text(
                              'Electronic signature',
                              style: const TextStyle(fontSize: 8),
                            ),
                            Container(
                              width: 100,
                              height: 12,
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: PdfColors.grey600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CampoFormulario(
                          title: 'Unit Global Supply Chain(W&S or M&E or Log)',
                          text: changeOrder.globalunitglobalsccm,
                          widthField: 330,
                          widthContainer: 110,
                        ),
                        Row(
                          children: [
                            Text(
                              'Electronic visa',
                              style: const TextStyle(fontSize: 8),
                            ),
                            Container(
                              width: 100,
                              height: 12,
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: PdfColors.grey600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CampoFormulario(
                          title: 'Head of Supply Chain (W&S or M&E or Log)',
                          text: changeOrder.globalheadofsccm,
                          widthField: 330,
                          widthContainer: 110,
                        ),
                        Row(
                          children: [
                            Text(
                              'Electronic visa',
                              style: const TextStyle(fontSize: 8),
                            ),
                            Container(
                              width: 100,
                              height: 12,
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: PdfColors.grey600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CampoFormulario(
                          title: 'Head of Global Supply Chain',
                          text: changeOrder.globalheadofglobalsccm,
                          widthField: 330,
                          widthContainer: 110,
                        ),
                        Row(
                          children: [
                            Text(
                              'Electronic signature',
                              style: const TextStyle(fontSize: 8),
                            ),
                            Container(
                              width: 100,
                              height: 12,
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: PdfColors.grey600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CampoFormulario(
                          title: 'Head of Global O&M',
                          text: changeOrder.globalheadofglobalomec,
                          widthField: 330,
                          widthContainer: 110,
                        ),
                        Row(
                          children: [
                            Text(
                              'Electronic signature',
                              style: const TextStyle(fontSize: 8),
                            ),
                            Container(
                              width: 100,
                              height: 12,
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: PdfColors.grey600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CampoFormulario(
                          title: 'Head of Enel Grids',
                          text: changeOrder.globalheadofglobalin,
                          widthField: 330,
                          widthContainer: 110,
                        ),
                        Row(
                          children: [
                            Text(
                              'Electronic signature',
                              style: const TextStyle(fontSize: 8),
                            ),
                            Container(
                              width: 100,
                              height: 12,
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: PdfColors.grey600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    ),
  );

  final pdfBytes = await doc.save();
  final blob = html.Blob([pdfBytes], 'application/pdf');
  final url = html.Url.createObjectUrlFromBlob(blob);
  html.window.open(url, "_blank");
  // html.Url.revokeObjectUrl(url);
}

class CampoFormulario extends StatelessWidget {
  final String title;
  final String text;
  final double widthField;
  final double widthContainer;
  final double heightContainer;
  final String additionalMessage;
  CampoFormulario({
    required this.title,
    required this.text,
    required this.widthField,
    required this.widthContainer,
    this.heightContainer = 12,
    this.additionalMessage = '',
  });
  @override
  Widget build(Context context) {
    return SizedBox(
      width: widthField,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 8),
            overflow: TextOverflow.clip,
          ),
          Row(
            children: [
              Text(
                additionalMessage,
                style: const TextStyle(fontSize: 8),
              ),
              Container(
                width: widthContainer,
                height: heightContainer,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: PdfColors.grey),
                ),
                child: Text(
                  text,
                  overflow: TextOverflow.clip,
                  style: const TextStyle(
                    fontSize: 6,
                    color: PdfColors.grey900,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Expanded fieldPdf({
  int flex = 1,
  required String campo,
  required String valor,
}) {
  return Expanded(
    flex: flex,
    child: RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$campo: ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(text: valor),
        ],
      ),
    ),
  );
}
