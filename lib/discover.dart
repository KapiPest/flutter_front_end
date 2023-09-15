import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MaterialApp(
    home: DiscoverPage(),
    ) 
  );
}

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  State<DiscoverPage> createState() => DiscoverPageState();
}

class DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double imageWidth = 200;
    double pos = (screenWidth - imageWidth) / 2;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/blue_gradient_background.jpg"),
                fit: BoxFit.cover)
                ),
        child: Stack(
          children: [
            Positioned(
              top: 60,
              left: 40,
              child: Text(
                "Discover",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 71, 71, 71),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 130,
              left: pos,
              child: Container(
                height: 200,
                width: 200,
                child: Image.asset(
                  "images/discover_data.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 340,
              child: Container(
                width: screenWidth,
                height: screenHeight,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(247, 247, 247, 255),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 30,
                      left: 40,
                      child: Text(
                        "GAIN INSIGHTS",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 71, 71, 71),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      //What is Water Quality
                      top: 90,
                      child: Container(
                        width: screenWidth,
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  contentPadding: const EdgeInsets.all(0),
                                  content: SizedBox(
                                    width: screenWidth *
                                        0.9, // Set to 90% of the screenWidth
                                    height: 550, // Set the height to 400
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(top: 50),
                                          child: Center(
                                            child: RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Water ",
                                                    style: GoogleFonts.poppins(
                                                      textStyle: const TextStyle(
                                                        fontSize: 30,
                                                        fontWeight:FontWeight.w500,
                                                        color: Color.fromARGB(255, 71, 71, 71),
                                                      ),
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: "Quality",
                                                    style: GoogleFonts.poppins(
                                                      textStyle:
                                                          const TextStyle(
                                                        fontSize: 30,
                                                        fontWeight: FontWeight.w600,
                                                        color: Color.fromARGB(255, 7, 155, 150),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 0,
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.all(30), // Set margin here
                                            child: SingleChildScrollView(
                                              child: RichText(
                                                text: TextSpan(
                                                  style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: Color.fromARGB(255, 71, 71, 71),
                                                    ),
                                                  ),
                                                  children: const <TextSpan>[
                                                    TextSpan(
                                                      text: "What Is Water Quality? \n\n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w800,
                                                      fontSize: 16,
                                                      ),
                                                    ), 

                                                    TextSpan(
                                                      text: "Water quality is “a measure of the suitability of water for a particular use based on selected physical, chemical, and biological characteristics” according to the United States Geological Survey (USGS). Therefore, it is a measure of water conditions relative to the need or purpose of humans or even the requirements of various land or aquatic animal species. \n \n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w500,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                     TextSpan(
                                                      text: "What Are the Categories of Water Quality?? \n\n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w800,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "1. Water Quality for Human Consumption \n\n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w800,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "Water quality for human consumption covers safe drinking and cooking water which are both vital for maintaining human health and form part of public health policy. Access to high-quality water fit for human consumption, known as “potable water”, is a fundamental human right and a necessity for healthy life and development for individuals and societies. This right was enshrined in international law by UN Resolution 64/292 in July of 2010. \n \n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w500,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                     TextSpan(
                                                      text: "2. Water Quality for Industrial and Domestic Use \n\n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w800,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "In industrial settings, a specific type of water called “process water” is used. Process water refers to water that is used in industry, manufacturing processes, power generation, and similar applications. Water quality standards for process water are meant to prevent damage to industrial machinery and to prevent the contamination of industrially processed products. \n \n"
                                                            "To highlight the complexity of industrial use of water quality standards, WHO international parameters for water used in the pharmaceutical industry can be taken as an example. Process water for the pharmaceutical industry is subject to water quality regulations relating to its storage, distribution, sanitization, bioburden control, as well as its distribution system monitoring, maintenance, and inspection. \n \n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w500,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                       TextSpan(
                                                      text: "3. Environmental Water Quality \n\n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w800,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "Environmental water quality is highly important for the well-being of flora and fauna in oceans, rivers, lakes, swamps, and wetlands. It impacts people and higher-order species which depend on these ecosystems for food and transfer of nutrients. As such, governmental organizations have regulated different subcategories of environmental water quality. \n \n"
                                                            "The US EPA regulates environmental water quality parameters for the protection and propagation of fish and shellfish populations, waterfowl, shorebirds, and other water-oriented wildlife. Environmental water quality parameters are regulated for the protection and preservation of coral reefs, marinas, groundwater, and aquifers. \n \n"
                                                            "Poor environmental water quality related to contamination by chemicals or microorganisms from farms, towns, and factories is an ever-growing issue. According to United Nation statistics, more than 80 percent of the world’s wastewater flows back into the environment without being treated. This degree of contamination poses risks to humans and aquatic wildlife alike. \n \n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w500,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },

                            //End of Pop Up
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              backgroundColor:const Color.fromARGB(255, 255, 255, 255),
                              elevation: 2,
                              shadowColor: Colors.grey.withOpacity(0.3),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Align(alignment: Alignment.centerLeft,
                                child: Text( 
                                  "What is Water Quality?",
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 71, 71, 71),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      //What are Water Parameters
                      top: 155,
                      child: Container(
                        width: screenWidth,
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  contentPadding: const EdgeInsets.all(0),
                                  content: SizedBox(
                                    width: screenWidth * 0.9, // Set to 90% of the screenWidth
                                    height: 550, // Set the height to 400
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(top: 50),
                                          child: Center(
                                            child: RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Water ",
                                                    style: GoogleFonts.poppins(
                                                      textStyle: const TextStyle(
                                                        fontSize: 30,
                                                        fontWeight: FontWeight.w500,
                                                        color: Color.fromARGB(255, 71, 71, 71),
                                                      ),
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: "Parameters",
                                                    style: GoogleFonts.poppins(
                                                      textStyle:
                                                          const TextStyle(
                                                        fontSize: 30,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Color.fromARGB(
                                                            255, 7, 155, 150),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 0,
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.all(
                                                30), // Set margin here
                                            child: SingleChildScrollView(
                                              child: RichText(
                                                text: TextSpan(
                                                  style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: Color.fromARGB(
                                                          255, 71, 71, 71),
                                                    ),
                                                  ),
                                                  children: const <TextSpan>[
                                                    TextSpan(
                                                      text: "What are Water Parameters?  \n\n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w800,
                                                      fontSize: 16,
                                                      ),
                                                    ), 

                                                    TextSpan(
                                                      text: "Typically, water quality is determined by comparing the physical and chemical characteristics of a water sample with water quality guidelines or standards. \n \n"
                                                            "There are three types of parameters of water quality that are being measured. These include physical, chemical, and biological/microbiological parameters. \n \n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w500,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "Physical parameters of water quality ",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w800,
                                                      fontSize: 16,
                                                      ),
                                                    ), 

                                                    TextSpan(
                                                      text: "are those that are determined by the senses of sight, smell, taste, and touch. These physical parameters include temperature, color, taste and odor, turbidity, and content of dissolved solids. \n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w500,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "Chemical parameters of water quality ",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w800,
                                                      fontSize: 16,
                                                      ),
                                                    ), 

                                                    TextSpan(
                                                      text: "are measures of those characteristics which reflect the environment with which water has contact. These chemical parameters can measure pH, hardness, amount of dissolved oxygen, biochemical oxygen demand (BOD), chemical oxygen demand (COD), and levels of chloride, chlorine residual, sulfate, nitrogen, fluoride, iron and manganese, copper and zinc, toxic organic and inorganic substances, as well as radioactive substances. \n ",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w500,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "Biological parameters of water quality ",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w800,
                                                      fontSize: 16,
                                                      ),
                                                    ), 

                                                    TextSpan(
                                                      text: "are those measurements that reflect the number of bacteria, algae, viruses, and protozoa that are present in water. \n\n ",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w500,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                     TextSpan(
                                                      text: "Water Quality Indicators and Parameters \n\n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w800,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "These are water quality indicators and parameters that reflect the impact of natural and artificial processes. \n\n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w500,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "Turbidity: ",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w800,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "Turbidity refers to the cloudiness of water and is a measure of the ability of light to pass through it. Turbidity is caused by different suspended materials in water such as organic material, clay, silt, and other particulate matter. High turbidity is aesthetically unappealing and increases the cost of water treatment. Particulate matter provides hiding places for harmful microorganisms, shields them from disinfection processes, and absorbs heavy metals and other harmful chemicals. \n \n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w500,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "Temperature: ",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w800,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "Temperature has indirect influences on water quality. It influences the palatability, viscosity, solubility, and odor of water. It affects the disinfection and chlorination processes, biological oxygen demand (BOD), and the way heavy metals behave in water. \n\n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w500,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "Color: ",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w800,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "Color reflects the concentration of vegetation and inorganic matter in water. Although it has no direct influence on the safety of water, it makes water aesthetically unappealing. \n\n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w500,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "Taste and Odor: ",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w800,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "Taste and odor affect the aesthetic qualities of water. They are determined by the presence of natural, domestic, or agricultural foreign matter in water.Total Solids (TS): In water two types of solids are present, Total Dissolved Solids (TDS) and Total Suspended Solids (TSS). Solids represent the amount of minerals (good or bad) and contamination present in water. When harmful solids are present, it affects the quality of water by affecting turbidity, temperature, color, taste, odor, electrical conductivity, and dissolved oxygen content. \n\n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w500,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "Electrical Conductivity: ",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w800,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "Electrical conductivity indirectly measures the ionic concentration of water by measuring its ability to carry or conduct an electrical current. Higher conductivity means more solids are present in the water. \n \n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w500,
                                                      fontSize: 16,
                                                      ),
                                                    ),
                                                    
                                                    TextSpan(
                                                      text: "pH: ",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w800,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "pH measures how acidic or basic water is. Excessively high or low (<4 or >11) pH is detrimental for the use of water as it alters the taste, effectiveness of its chlorine disinfection process, and increases the solubility of heavy metals in water making them more toxic. \n \n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w500,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "Hardness: ",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w800,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "Hardness is a property of mineralized water, and it measures the concentrations of certain dissolved minerals, particularly calcium and magnesium. Hard water can cause mineral buildup in hot water pipes and cause difficulty in producing lather with soap. Very hard water (>500 mg/L of CaCO3) can even have laxative properties. \n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w500,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "Dissolved oxygen (DO): ",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w800,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "Dissolved oxygen is an indirect measure of water pollution in streams, rivers, and lakes. The lower the concentration of dissolved oxygen, the worse the water quality. Water with very little or no oxygen tastes bad to most users. \n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w500,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "Biochemical oxygen demand (BOD): ",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w800,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "Biochemical oxygen demand indirectly measures the degree of microbial contamination, and is primarily used as a measurement of the power of sewage water. As microorganisms metabolize organic substances for food, they consume dissolved oxygen (DO) in water. As such, BOD is an indirect indicator of organic material in water. \n",

                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w500,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "Chemical oxygen demand (COD): ",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w800,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "Chemical oxygen demand measures the oxygen necessary to oxidize all biodegradable and non-biodegradable substances in the water. \n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w500,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "Toxic inorganic substances: ",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w800,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "Toxic inorganic substances measure the concentrations of metallic and nonmetallic compounds such as arsenic, silver, mercury, lead, cadmium, nitrates, and cyanide. The parameters regarding toxic inorganic substances are essential for assessing the quality of water, as their presence, sometimes even in trace amounts, poses a danger to public health.  \n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w500,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "Toxic organic substances: ",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w800,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "Toxic organic substances refer to compounds such as insecticides, pesticides, solvents, detergents, and disinfectants that degrade water quality and pose a danger to human health. \n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w500,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "Radioactive substances: ",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w800,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "Radioactive substances decay to emit beta, alpha, and gamma radiation, which has numerous detrimental effects on human health. Radiation primarily affects hematopoietic, gastrointestinal, reproductive, and nervous systems; and is highly carcinogenic. Water quality parameters therefore commonly monitor the concentrations of alpha particles, beta particles, radium, and uranium.  \n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w500,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "Bio-indicators: ",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w800,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "Biological parameters of water quality analyze the presence or absence of various bacteria, algae, viruses, and protozoa. ",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w500,
                                                      fontSize: 16,
                                                      ),
                                                    ),


                                                 ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }, //End of Pop Up
                            

                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              elevation: 2,
                              shadowColor: Colors.grey.withOpacity(0.3),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "What are Water Parameters?",
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 71, 71, 71),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      //Different Water Sources and Levels
                      top: 220,
                      child: Container(
                        width: screenWidth,
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  contentPadding: const EdgeInsets.all(0),
                                  content: SizedBox(
                                    width: screenWidth *
                                        0.9, // Set to 90% of the screenWidth
                                    height: 550, // Set the height to 400
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(top: 50),
                                          child: Center(
                                            child: RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Water ",
                                                    style: GoogleFonts.poppins(
                                                      textStyle:
                                                          const TextStyle(
                                                        fontSize: 30,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Color.fromARGB(
                                                            255, 71, 71, 71),
                                                      ),
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: "Sources",
                                                    style: GoogleFonts.poppins(
                                                      textStyle:
                                                          const TextStyle(
                                                        fontSize: 30,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Color.fromARGB(
                                                            255, 7, 155, 150),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 0,
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.all(
                                                30), // Set margin here
                                            child: SingleChildScrollView(
                                              child: RichText(
                                                text: TextSpan(
                                                  style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: Color.fromARGB(
                                                          255, 71, 71, 71),
                                                    ),
                                                  ),
                                                  children: const <TextSpan>[
                                                    TextSpan(
                                                      text: "Different water sources and levels \n\n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w800,
                                                      fontSize: 16,
                                                      ),
                                                    ), 

                                                    TextSpan(
                                                      text: "Surface Water: \n  ",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w800,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                     TextSpan(
                                                      text: "This includes rivers, lakes, reservoirs, and ponds. The indicators and parameters monitored in surface water can vary based on factors such as urban runoff, agricultural runoff, and industrial discharges. For example, monitoring nutrient levels and sediment load might be crucial in assessing the health of a river ecosystem. \n\n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w500,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "Groundwater: \n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w800,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "Groundwater is found beneath the Earths surface in aquifers. Monitoring parameters such as pH, mineral content, and contaminants like heavy metals can be important for ensuring the safety of drinking water from wells. \n \n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w500,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                     TextSpan(
                                                      text: "Ocean and Seas: \n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w800,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "Monitoring in marine environments involves a different set of indicators due to factors like salinity, temperature variations, and marine life diversity. Parameters such as dissolved oxygen, nutrient levels, and acidity (pH) are important in marine ecosystems. \n\n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w500,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                       TextSpan(
                                                      text: "Different Levels of Water Quality Assessment \n\n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w800,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "Primary/Basic Level: \n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w800,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "At this level, basic indicators like temperature, pH, and turbidity might be monitored. This level is often used for routine water quality checks, especially in settings where more advanced equipment might not be available. \n\n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w500,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "Intermediate Level: \n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w800,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "Here, a broader range of indicators is measured, including dissolved oxygen, nutrient concentrations, and bacterial counts. This level of assessment provides a more comprehensive understanding of water quality and its potential impact on ecosystems and human health. \n \n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w500,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "Advanced Comprehensive Level: \n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w800,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "This involves a detailed analysis of various chemical, biological, and physical parameters. Advanced equipment and techniques are used to detect even trace amounts of contaminants and to study complex interactions in aquatic systems. \n\n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w500,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "Regulatory Level: \n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w800,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "Regulatory agencies often establish specific standards for water quality parameters based on the intended use of the water. For example, drinking water standards set by health authorities might require stringent monitoring of indicators like pathogens and heavy metals. \n\n"
                                                            "In all cases, the choice of indicators and parameters depends on the goals of monitoring and the specific characteristics of the water source. Water quality assessment aims to ensure that water is safe for its intended uses and that the aquatic ecosystem is not adversely impacted. Monitoring these indicators and parameters helps to identify trends, detect pollution, and guide management strategies to maintain and improve water quality. \n\n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w500,
                                                      fontSize: 16,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }, // end of Popup


                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              elevation: 2,
                              shadowColor: Colors.grey.withOpacity(0.3),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Different Water Sources and Levels",
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 71, 71, 71),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      //What is Water Sampling?
                      top: 285,
                      child: Container(
                        width: screenWidth,
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: ElevatedButton(
                            onPressed: () { 
                                 showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  contentPadding: const EdgeInsets.all(0),
                                  content: SizedBox(
                                    width: screenWidth *
                                        0.9, // Set to 90% of the screenWidth
                                    height: 550, // Set the height to 400
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(top: 50),
                                          child: Center(
                                            child: RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Water ",
                                                    style: GoogleFonts.poppins(
                                                      textStyle:
                                                          const TextStyle(
                                                        fontSize: 30,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Color.fromARGB(
                                                            255, 71, 71, 71),
                                                      ),
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: "Sampling",
                                                    style: GoogleFonts.poppins(
                                                      textStyle:
                                                          const TextStyle(
                                                        fontSize: 30,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Color.fromARGB(
                                                            255, 7, 155, 150),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 0,
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.all(
                                                30), // Set margin here
                                            child: SingleChildScrollView(
                                              child: RichText(
                                                text: TextSpan(
                                                  style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: Color.fromARGB(
                                                          255, 71, 71, 71),
                                                    ),
                                                  ),
                                                  children: const <TextSpan>[
                                                    TextSpan(
                                                      text: "Water Sampling \n\n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w800,
                                                      fontSize: 16,
                                                      ),
                                                    ), 

                                                    TextSpan(
                                                      text: "Water sampling is the process of collecting representative samples of water from various sources, such as rivers, lakes, oceans, groundwater, and even wastewater treatment plants. These samples are collected for analysis and testing to assess the quality, composition, and characteristics of the water. Water sampling is a critical part of environmental monitoring, research, and regulatory compliance. plays a vital role in understanding the state of water bodies, ensuring safe drinking water, and protecting aquatic ecosystems. It provides valuable information for scientific research, regulatory compliance, and policy-making related to water resources and environmental protection. \n \n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w500,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                     TextSpan(
                                                      text: "Here are the key aspects of water sampling: \n\n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w800,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "1. Purpose \n\n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w800,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "Water sampling serves various purposes, including monitoring water quality for human consumption, assessing the health of aquatic ecosystems, identifying pollution sources, and ensuring compliance with environmental regulations. \n \n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w500,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                     TextSpan(
                                                      text: "2. Sampling Techniques \n\n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w800,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "There are different water sampling techniques depending on the source and purpose. Some common techniques include grab sampling (collecting a single sample at a specific location and time), composite sampling (mixing multiple grab samples for a representative sample), and continuous monitoring (using automated instruments to collect real-time data). \n \n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w500,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                       TextSpan(
                                                      text: "3. Parameters \n\n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w800,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "Water samples can be analyzed for a wide range of parameters, including physical (temperature, turbidity), chemical (pH, dissolved oxygen, nutrients), and biological (bacteria, algae) indicators. These parameters help assess water quality, contamination levels, and ecosystem health. \n\n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w500,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                     TextSpan(
                                                      text: "4. Frequency \n\n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w800,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "Sampling frequency varies based on the objectives. Regular monitoring may occur daily, weekly, monthly, or seasonally, depending on the type of water body and the parameters being monitored. \n\n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w500,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                     TextSpan(
                                                      text: "5. Sampling Locations \n\n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w800,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "Samples are collected from various points within a water body, considering factors such as flow patterns, potential pollution sources, and areas of interest. \n\n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w500,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "6. Equipment \n\n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w800,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "Sampling equipment includes bottles, containers, and instruments designed to collect and preserve water samples. Properly cleaned and sterilized equipment is essential to prevent contamination. \n\n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w500,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "7. Preservation \n\n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w800,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "Depending on the parameters being tested, samples may need to be preserved to prevent changes in their properties before analysis. For example, samples for nutrient analysis might need to be refrigerated to prevent bacterial activity. \n\n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w500,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "8. Analysis \n\n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w800,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "Collected water samples are analyzed in laboratories using specialized equipment and methods. The results provide insights into water quality and potential contamination. \n\n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w500,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "9. Regulations \n\n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w800,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "Water sampling is often governed by environmental regulations and standards set by local, regional, and national authorities. Compliance with these regulations is crucial for maintaining safe water supplies and protecting ecosystems. \n\n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w500,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "10. Interpretation \n\n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w800,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                    TextSpan(
                                                      text: "Analyzed data is used to assess water quality trends, identify pollution sources, and make informed decisions regarding water management and treatment. \n \n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w500,
                                                      fontSize: 16,
                                                      ),
                                                    ),

                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );  
                            }, // end of pop up

                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              elevation: 2,
                              shadowColor: Colors.grey.withOpacity(0.3),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "What is Water Sampling?",
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 71, 71, 71),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      //World Health Organization (WHO)
                      top: 350,
                      child: Container(
                        width: screenWidth,
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  contentPadding: const EdgeInsets.all(0),
                                  content: SizedBox(
                                    width: screenWidth *
                                        0.9, // Set to 90% of the screenWidth
                                    height: 550, // Set the height to 400
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(top: 50),
                                          child: Center(
                                            child: RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "WHO ",
                                                    style: GoogleFonts.poppins(
                                                      textStyle:
                                                          const TextStyle(
                                                        fontSize: 30,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Color.fromARGB(
                                                            255, 71, 71, 71),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 0,
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.all(
                                                30), // Set margin here
                                            child: SingleChildScrollView(
                                              child: RichText(
                                                text: TextSpan(
                                                  style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: Color.fromARGB(
                                                          255, 71, 71, 71),
                                                    ),
                                                  ),
                                                  children: const <TextSpan>[
                                                    TextSpan(
                                                      text: "What is WHO? \n\n",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w800,
                                                      fontSize: 16,
                                                      ),
                                                    ), 

                                                    TextSpan(
                                                      text: "The World Health Organization is a United Nations specialized agency in charge of international public health. The WHO Constitution states that its main goal is the attainment of the highest possible level of health by all peoples.",
                                                      style: TextStyle(
                                                      fontWeight:FontWeight.w500,
                                                      fontSize: 16,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );


                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              elevation: 2,
                              shadowColor: Colors.grey.withOpacity(0.3),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "World Health Organization (WHO)",
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 71, 71, 71),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ], //children
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
