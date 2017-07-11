unit Cbw;

interface

(*************************************************************************
 *
 * Name:   CBW.H
 *
 * C/C++ Windows header for Measurement Computing Universal Library
 *
 * (c) Copyright 1996-2015, Measurement Computing Corp.
 * All rights reserved.
 *
 * This header file should be included in all C/C++ programs that will
 * call the Measurement Computing Universal Library from Windows.
 *
 *
 **************************************************************************)

(* Current Revision Number *)
const
  CURRENTREVNUM      = 6.51;

(* System error code *)
const
  NOERRORS               = 0;    (* No error occurred *)
  BADBOARD               = 1;    (* Invalid board number specified *)
  DEADDIGITALDEV         = 2;    (* Digital I/O device is not responding  *)
  DEADCOUNTERDEV         = 3;    (* Counter I/O device is not responding *)
  DEADDADEV              = 4;    (* D/A is not responding *)
  DEADADDEV              = 5;    (* A/D is not responding *)
  NOTDIGITALCONF         = 6;    (* Specified board does not have digital I/O *)
  NOTCOUNTERCONF         = 7;    (* Specified board does not have a counter *)
  NOTDACONF              = 8;    (* Specified board is does not have D/A *)
  NOTADCONF              = 9;    (* Specified board does not have A/D *)
  NOTMUXCONF             = 10;   (* Specified board does not have thermocouple inputs *)
  BADPORTNUM             = 11;   (* Invalid port number specified *)
  BADCOUNTERDEVNUM       = 12;   (* Invalid counter device *)
  BADDADEVNUM            = 13;   (* Invalid D/A device *)
  BADSAMPLEMODE          = 14;   (* Invalid sampling mode option specified *)
  BADINT                 = 15;   (* Board configured for invalid interrupt level *)
  BADADCHAN              = 16;   (* Invalid A/D channel Specified *)
  BADCOUNT               = 17;   (* Invalid count specified *)
  BADCNTRCONFIG          = 18;   (* invalid counter configuration specified *)
  BADDAVAL               = 19;   (* Invalid D/A output value specified *)
  BADDACHAN              = 20;   (* Invalid D/A channel specified *)
  ALREADYACTIVE          = 22;   (* A background process is already in progress *)
  PAGEOVERRUN            = 23;   (* DMA transfer crossed page boundary, may have gaps in data *)
  BADRATE                = 24;   (* Inavlid sampling rate specified *)
  COMPATMODE             = 25;   (* Board switches set for "compatible" mode *)
  TRIGSTATE              = 26;   (* Incorrect intial trigger state D0 must=TTL low) *)
  ADSTATUSHUNG           = 27;   (* A/D is not responding *)
  TOOFEW                 = 28;   (* Too few samples before trigger occurred *)
  OVERRUN                = 29;   (* Data lost due to overrun, rate too high *)
  BADRANGE               = 30;   (* Invalid range specified *)
  NOPROGGAIN             = 31;   (* Board does not have programmable gain *)
  BADFILENAME            = 32;   (* Not a legal DOS filename *)
  DISKISFULL             = 33;   (* Couldn't complete, disk is full *)
  COMPATWARN             = 34;   (* Board is in compatible mode, so DMA will be used *)
  BADPOINTER             = 35;   (* Invalid pointer (NULL) *)
  TOOMANYGAINS           = 36;   (* Too many gains *)
  RATEWARNING            = 37;   (* Rate may be too high for interrupt I/O *)
  CONVERTDMA             = 38;   (* CONVERTDATA cannot be used with DMA I/O *)
  DTCONNECTERR           = 39;   (* Board doesn't have DT Connect *)
  FORECONTINUOUS         = 40;   (* CONTINUOUS can only be used with BACKGROUND *)
  BADBOARDTYPE           = 41;   (* This function can not be used with this board *)
  WRONGDIGCONFIG         = 42;   (* Digital I/O is configured incorrectly *)
  NOTCONFIGURABLE        = 43;   (* Digital port is not configurable *)
  BADPORTCONFIG          = 44;   (* Invalid port configuration specified *)
  BADFIRSTPOINT          = 45;   (* First point argument is not valid *)
  ENDOFFILE              = 46;   (* Attempted to read past end of file *)
  NOT8254CTR             = 47;   (* This board does not have an 8254 counter *)
  NOT9513CTR             = 48;   (* This board does not have a 9513 counter *)
  BADTRIGTYPE            = 49;   (* Invalid trigger type *)
  BADTRIGVALUE           = 50;   (* Invalid trigger value *)
  BADOPTION              = 52;   (* Invalid option specified for this function *)
  BADPRETRIGCOUNT        = 53;   (* Invalid pre-trigger count sepcified *)
  BADDIVIDER             = 55;   (* Invalid fout divider value *)
  BADSOURCE              = 56;   (* Invalid source value  *)
  BADCOMPARE             = 57;   (* Invalid compare value *)
  BADTIMEOFDAY           = 58;   (* Invalid time of day value *)
  BADGATEINTERVAL        = 59;   (* Invalid gate interval value *)
  BADGATECNTRL           = 60;   (* Invalid gate control value *)
  BADCOUNTEREDGE         = 61;   (* Invalid counter edge value *)
  BADSPCLGATE            = 62;   (* Invalid special gate value *)
  BADRELOAD              = 63;   (* Invalid reload value *)
  BADRECYCLEFLAG         = 64;   (* Invalid recycle flag value *)
  BADBCDFLAG             = 65;   (* Invalid BCD flag value *)
  BADDIRECTION           = 66;   (* Invalid count direction value *)
  BADOUTCONTROL          = 67;   (* Invalid output control value *)
  BADBITNUMBER           = 68;   (* Invalid bit number *)
  NONEENABLED            = 69;   (* None of the counter channels are enabled *)
  BADCTRCONTROL          = 70;   (* Element of control array not ENABLED/DISABLED *)
  BADEXPCHAN             = 71;   (* Invalid EXP channel *)
  WRONGADRANGE           = 72;   (* Wrong A/D range selected for cbtherm *)
  OUTOFRANGE             = 73;   (* Temperature input is out of range *)
  BADTEMPSCALE           = 74;   (* Invalid temperate scale *)
  BADERRCODE             = 75;   (* Invalid error code specified *)
  NOQUEUE                = 76;   (* Specified board does not have chan/gain queue *)
  CONTINUOUSCOUNT        = 77;   (* CONTINUOUS can not be used with this count value *)
  UNDERRUN               = 78;   (* D/A FIFO hit empty while doing output *)
  BADMEMMODE             = 79;   (* Invalid memory mode specified *)
  FREQOVERRUN            = 80;   (* Measured frequency too high for gating interval *)
  NOCJCCHAN              = 81;   (* Board does not have CJC chan configured *)
  BADCHIPNUM             = 82;   (* Invalid chip number used with cbC9513Init *)
  DIGNOTENABLED          = 83;   (* Digital I/O not enabled *)
  CONVERT16BITS          = 84;   (* CONVERT option not allowed with 16 bit A/D *)
  NOMEMBOARD             = 85;   (* EXTMEMORY option requires memory board *)
  DTACTIVE               = 86;   (* Memory I/O while DT Active *)
  NOTMEMCONF             = 87;   (* Specified board is not a memory board *)
  ODDCHAN                = 88;   (* First chan in queue can not be odd *)
  CTRNOINIT              = 89;   (* Counter was not initialized *)
  NOT8536CTR             = 90;   (* Specified counter is not an 8536 *)
  FREERUNNING            = 91;   (* A/D sampling is not timed *)
  INTERRUPTED            = 92;   (* Operation interrupted with CTRL-C *)
  NOSELECTORS            = 93;   (* Selector could not be allocated *)
  NOBURSTMODE            = 94;   (* Burst mode is not supported on this board *)
  NOTWINDOWSFUNC         = 95;   (* This function not available in Windows lib *)
  NOTSIMULCONF           = 96;   (* Not configured for simultaneous update *)
  EVENODDMISMATCH        = 97;   (* Even channel in odd slot in the queue *)
  M1RATEWARNING          = 98;   (* DAS16/M1 sample rate too fast *)
  NOTRS485               = 99;   (* Board is not an RS-485 board *)
  NOTDOSFUNC             = 100;  (* This function not avaliable in DOS *)
  RANGEMISMATCH          = 101;  (* Unipolar and Bipolar can not be used together in A/D que *)
  CLOCKTOOSLOW           = 102;  (* Sample rate too fast for clock jumper setting *)
  BADCALFACTORS          = 103;  (* Cal factors were out of expected range of values *)
  BADCONFIGTYPE          = 104;  (* Invalid configuration type information requested *)
  BADCONFIGITEM          = 105;  (* Invalid configuration item specified *)
  NOPCMCIABOARD          = 106;  (* Can't acces PCMCIA board *)
  NOBACKGROUND           = 107;  (* Board does not support background I/O *)
  STRINGTOOSHORT         = 108;  (* String passed to cbGetBoardName is to short *)
  CONVERTEXTMEM          = 109;  (* Convert data option not allowed with external memory *)
  BADEUADD               = 110;  (* e_ToEngUnits addition error *)
  DAS16JRRATEWARNING     = 111;  (* use 10 MHz clock for rates > 125KHz *)
  DAS08TOOLOWRATE        = 112;  (* DAS08 rate set too low for AInScan warning *)
  AMBIGSENSORONGP        = 114;  (* more than one sensor type defined for EXP-GP *)
  NOSENSORTYPEONGP       = 115;  (* no sensor type defined for EXP-GP *)
  NOCONVERSIONNEEDED     = 116;  (* 12 bit board without chan tags - converted in ISR *)
  NOEXTCONTINUOUS        = 117;  (* External memory cannot be used in CONTINUOUS mode *)
  INVALIDPRETRIGCONVERT  = 118;  (* cbAConvertPretrigData was called after failure in cbAPretrig *)
  BADCTRREG              = 119;  (* bad arg to CLoad for 9513 *)
  BADTRIGTHRESHOLD       = 120;  (* Invalid trigger threshold specified in cbSetTrigger *)
  BADPCMSLOTREF          = 121;  (* No PCM card in specified slot *)
  AMBIGPCMSLOTREF        = 122;  (* More than one MCC PCM card in slot *)
  BADSENSORTYPE          = 123;  (* Bad sensor type selected in Instacal *)
  DELBOARDNOTEXIST       = 124;  (* tried to delete board number which doesn't exist *)
  NOBOARDNAMEFILE        = 125;  (* board name file not found *)
  CFGFILENOTFOUND        = 126;  (* configuration file not found *)
  NOVDDINSTALLED         = 127;  (* CBUL.386 device driver not installed *)
  NOWINDOWSMEMORY        = 128;  (* No Windows memory available *)
  OUTOFDOSMEMORY         = 129;  (* ISR data struct alloc failure *)
  OBSOLETEOPTION         = 130;  (* Obsolete option for cbGetConfig/cbSetConfig *)
  NOPCMREGKEY            = 131;  (* No registry entry for this PCMCIA board *)
  NOCBUL32SYS            = 132;  (* CBUL32.SYS device driver is not loaded *)
  NODMAMEMORY            = 133;  (* No DMA buffer available to device driver *)
  IRQNOTAVAILABLE        = 134;  (* IRQ in being used by another device *)
  NOT7266CTR             = 135;  (* This board does not have an LS7266 counter *)
  BADQUADRATURE          = 136;  (* Invalid quadrature specified *)
  BADCOUNTMODE           = 137;  (* Invalid counting mode specified *)
  BADENCODING            = 138;  (* Invalid data encoding specified *)
  BADINDEXMODE           = 139;  (* Invalid index mode specified *)
  BADINVERTINDEX         = 140;  (* Invalid invert index specified *)
  BADFLAGPINS            = 141;  (* Invalid flag pins specified *)
  NOCTRSTATUS            = 142;  (* This board does not support cbCStatus() *)
  NOGATEALLOWED          = 143;  (* Gating and indexing not allowed simultaneously *)
  NOINDEXALLOWED         = 144;  (* Indexing not allowed in non-quadratue mode *)
  OPENCONNECTION         = 145;  (* Temperature input has open connection *)
  BMCONTINUOUSCOUNT      = 146;  (* Count must be integer multiple of packetsize for recycle mode. *)
  BADCALLBACKFUNC        = 147;  (* Invalid pointer to callback function passed as arg *)
  MBUSINUSE              = 148;  (* MetraBus in use *)
  MBUSNOCTLR             = 149;  (* MetraBus I/O card has no configured controller card *)
  BADEVENTTYPE           = 150;  (* Invalid event type specified for this board. *)
  ALREADYENABLED         = 151;  (* An event handler has already been enabled for this event type *)
  BADEVENTSIZE           = 152;  (* Invalid event count specified. *)
  CANTINSTALLEVENT       = 153;  (* Unable to install event handler *)
  BADBUFFERSIZE          = 154;  (* Buffer is too small for operation *)
  BADAIMODE              = 155;  (* Invalid analog input mode(RSE, NRSE, or DIFF) *)
  BADSIGNAL              = 156;  (* Invalid signal type specified. *)
  BADCONNECTION          = 157;  (* Invalid connection specified. *)
  BADINDEX               = 158;  (* Invalid index specified, or reached end of internal connection list. *)
  NOCONNECTION           = 159;  (* No connection is assigned to specified signal. *)
  BADBURSTIOCOUNT        = 160;  (* Count cannot be greater than the FIFO size for BURSTIO mode. *)
  DEADDEV                = 161;  (* Device has stopped responding. Please check connections. *)

  INVALIDACCESS          = 163;   (* Invalid access or privilege for specified operation *)
  UNAVAILABLE            = 164;   (* Device unavailable at time of request. Please repeat operation. *)
  NOTREADY               = 165;   (* Device is not ready to send data. Please repeat operation. *)
  BITUSEDFORALARM        = 169;   (* The specified bit is used for alarm. *)
  PORTUSEDFORALARM       = 170;   (* One or more bits on the specified port are used for alarm. *)
  PACEROVERRUN           = 171;   (* Pacer overrun, external clock rate too fast. *)
  BADCHANTYPE            = 172;   (* Invalid channel type specified. *)
  BADTRIGSENSE           = 173;   (* Invalid trigger sensitivity specified. *)
  BADTRIGCHAN            = 174;   (* Invalid trigger channel specified. *)
  BADTRIGLEVEL           = 175;   (* Invalid trigger level specified. *)
  NOPRETRIGMODE          = 176;   (* Pre-trigger mode is not supported for the specified trigger type. *)
  BADDEBOUNCETIME        = 177;   (* Invalid debounce time specified. *)
  BADDEBOUNCETRIGMODE    = 178;   (* Invalid debounce trigger mode specified. *)
  BADMAPPEDCOUNTER       = 179;   (* Invalid mapped counter specified. *)
  BADCOUNTERMODE         = 180;   (* This function can not be used with the current mode of the specified counter. *)
  BADTCCHANMODE          = 181;   (* Single-Ended mode can not be used for temperature input. *)
  BADFREQUENCY           = 182;   (* Invalid frequency specified. *)
  BADEVENTPARAM          = 183;   (* Invalid event parameter specified. *)
  NONETIFC               = 184;   (* No interface devices were found with required PAN ID and/or RF Channel. *)
  DEADNETIFC             = 185;   (* The interface device(s) with required PAN ID and RF Channel has failed. Please check connection. *)
  NOREMOTEACK            = 186;   (* The remote device is not responding to commands and queries. Please check device. *)
  INPUTTIMEOUT           = 187;   (* The device acknowledged the operation, but has not completed before the timeout. *)
  MISMATCHSETPOINTCOUNT  = 188;   (* Number of Setpoints not equal to number of channels with setpoint flag set *)
  INVALIDSETPOINTLEVEL   = 189;   (* Setpoint Level is outside channel range *)
  INVALIDSETPOINTOUTPUTTYPE  = 190; (* Setpoint Output Type is invalid *)
  INVALIDSETPOINTOUTPUTVALUE = 191; (* Setpoint Output Value is outside channel range *)
  INVALIDSETPOINTLIMITS  = 192;   (* Setpoint Comparison limit B greater than Limit A *)
  STRINGTOOLONG          = 193;   (* The string entered is too long for the operation and/or device. *)
  INVALIDLOGIN           = 194;   (* The account name and/or password entered is incorrect. *)
  SESSIONINUSE           = 195;   (* The device session is already in use. *)
  NOEXTPOWER             = 196;   (* External power is not connected. *)
  BADDUTYCYCLE           = 197;   (* Invalid duty cycle specified. *)
  BADINITIALDELAY        = 199;   (* Invalid initial delay specified *)
  NOTEDSSENSOR           = 1000;  (* No TEDS sensor was detected on the specified channel. *)
  INVALIDTEDSSENSOR      = 1001;  (* Connected TEDS sensor to the specified channel is not supported *)
  CALIBRATIONFAILED      = 1002;  (* Calibration failed *)
  BITUSEDFORTERMINALCOUNTSTATUS  = 1003; (* The specified bit is used for terminal count stauts. *)
  PORTUSEDFORTERMINALCOUNTSTATUS = 1004; (* One or more bits on the specified port are used for terminal count stauts. *)
  BADEXCITATION          = 1005;   (* Invalid excitation specified *)
  BADBRIDGETYPE          = 1006;   (* Invalid bridge type specified *)
  BADLOADVAL             = 1007;   (* Invalid load value specified *)
  BADTICKSIZE            = 1008;   (* Invalid tick size specified *)
  BTHCONNECTIONFAILED    = 1013;   (* Bluetooth connection failed *)
  INVALIDBTHFRAME        = 1014;   (* Invalid Bluetooth frame *)
  BADTRIGEVENT           = 1015;   (* Invalid trigger event specified *)
  NETCONNECTIONFAILED    = 1016;   (* Network connection failed *)
  DATASOCKETCONNECTIONFAILED = 1017; (* Data socket connection failed *)
  INVALIDNETFRAME        = 1018;   (* Invalid Network frame *)
  NETTIMEOUT             = 1019;   (* Network device did not respond within expected time *)
  NETDEVNOTFOUND         = 1020;   (* Network device not found *)
  INVALIDCONNECTIONCODE  = 1021;   (* Invalid connection code *)
  CONNECTIONCODEIGNORED  = 1022;   (* Connection code ignored *)
  NETDEVINUSE            = 1023;   (* Network device already in use *)
  NETDEVINUSEBYANOTHERPROC = 1024; (* Network device already in use by another process *)
  SOCKETDISCONNECTED     = 1025;   (* Socket Disconnected *)
  BOARDNUMINUSE          = 1026;   (* Board Number already in use *)
  DEVALREADYCREATED      = 1027;   (* Specified DAQ device already created *)
  BOARDNOTEXIST          = 1028;   (* Tried to release a board which doesn't exist *)
  INVALIDNETHOST         = 1029;   (* Invalid host specified *)
  INVALIDNETPORT         = 1030;   (* Invalid port specified *)
  INVALIDIFC             = 1031;   (* Invalid interface specified *)
  INVALIDAIINPUTMODE     = 1032;   (* Invalid input mode specified *)
  AIINPUTMODENOTCONFIGURABLE = 1033; (* Input mode not configurable *)
  INVALIDEXTPACEREDGE    = 1034;   (* Invalid external pacer edge *)
  CMREXCEEDED            = 1035;   (* Common-mode voltage range exceeded *)

const
  AIFUNCTION     = 1;    (* Analog Input Function    *)
  AOFUNCTION     = 2;    (* Analog Output Function   *)
  DIFUNCTION     = 3;    (* Digital Input Function   *)
  DOFUNCTION     = 4;    (* Digital Output Function  *)
  CTRFUNCTION    = 5;    (* Counter Function         *)
  DAQIFUNCTION   = 6;    (* Daq Input Function       *)
  DAQOFUNCTION   = 7;    (* Daq Output Function      *)

(* Calibration coefficient types *)
const
  COARSE_GAIN    = $01;
  COARSE_OFFSET  = $02;
  FINE_GAIN      = $04;
  FINE_OFFSET    = $08;
  GAIN           = COARSE_GAIN;
  OFFSET         = COARSE_OFFSET;

(******************************************************************
;*
;*               **** ATTENTION ALL DEVELOPERS ****
;*
;* When adding error codes, first determine if these are errors
;* that can be caused by the user or if they will never happen
;* in normal operation unless there is a bug.
;*
;* Only if they are user error should you put them in the list
;* above.  In that case be sure to give them a name that means
;* something from the user's point of view - rather than from the
;* programmer.  For example NO_VDD_INSTALLED rather than
;* DEVICE_CALL_FAILED.
;*
;* Do not add any errors to the section above without getting
;* agreement by the dept. so that all user header files and header
;* files for other versions of the library can be updates together.
;*
;* If it's an internal error, then be sure to add it to the
;* correct section below.
;*
;********************************************************************)

(* Internal errors returned by 16 bit library *)
const
  INTERNALERR            = 200;   (* 200-299 Internal library error  *)
  CANT_LOCK_DMA_BUF      = 201;   (* DMA buffer could not be locked *)
  DMA_IN_USE             = 202;   (* DMA already controlled by another VxD *)
  BAD_MEM_HANDLE         = 203;   (* Invalid Windows memory handle *)
  NO_ENHANCED_MODE       = 204;   (* Windows Enhance mode is not running *)
  MEMBOARDPROGERROR      = 211;   (* Program error getting memory board source *)

(* Internal errors returned by 32 bit library *)
  INTERNAL32_ERR         = 300;    (* 300-399 32 bit library internal errors *)
  NO_MEMORY_FOR_BUFFER   = 301;    (* 32 bit - default buffer allocation when no user buffer used with file *)
  WIN95_CANNOT_SETUP_ISR_DATA = 302; (* 32 bit - failure on INIT_ISR_DATA IOCTL call *)
  WIN31_CANNOT_SETUP_ISR_DATA = 303; (* 32 bit - failure on INIT_ISR_DATA IOCTL call *)
  CFG_FILE_READ_FAILURE  = 304;     (* 32 bit - error reading board configuration file *)
  CFG_FILE_WRITE_FAILURE = 305;     (* 32 bit - error writing board configuration file *)
  CREATE_BOARD_FAILURE   = 306;     (* 32 bit - failed to create board *)
  DEVELOPMENT_OPTION     = 307;     (* 32 bit - Config Option item used in development only *)
  CFGFILE_CANT_OPEN      = 308;     (* 32 bit - cannot open configuration file. *)
  CFGFILE_BAD_ID         = 309;     (* 32 bit - incorrect file id. *)
  CFGFILE_BAD_REV        = 310;     (* 32 bit - incorrect file version. *)
  CFGFILE_NOINSERT       = 311;     (*; *)
  CFGFILE_NOREPLACE      = 312;     (*; *)
  BIT_NOT_ZERO           = 313;     (*; *)
  BIT_NOT_ONE            = 314;     (*; *)
  BAD_CTRL_REG           = 315;     (* No control register at this location. *)
  BAD_OUTP_REG           = 316;     (* No output register at this location. *)
  BAD_RDBK_REG           = 317;     (* No read back register at this location. *)
  NO_CTRL_REG            = 318;     (* No control register on this board. *)
  NO_OUTP_REG            = 319;     (* No control register on this board. *)
  NO_RDBK_REG            = 320;     (* No control register on this board. *)
  CTRL_REG_FAIL          = 321;     (* internal ctrl reg test failed. *)
  OUTP_REG_FAIL          = 322;     (* internal output reg test failed. *)
  RDBK_REG_FAIL          = 323;     (* internal read back reg test failed. *)
  FUNCTION_NOT_IMPLEMENTED = 324;
  BAD_RTD_CONVERSION     = 325;     (* Overflow in RTD calculation *)
  NO_PCI_BIOS            = 326;     (* PCI BIOS not present in the PC *)
  BAD_PCI_INDEX          = 327;     (* Invalid PCI board index passed to PCI BIOS *)
  NO_PCI_BOARD           = 328;     (* Specified PCI board not detected *)
  PCI_ASSIGN_FAILED      = 329;     (* PCI resource assignment failed *)
  PCI_NO_ADDRESS         = 330;     (* No PCI address returned *)
  PCI_NO_IRQ             = 331;     (* No PCI IRQ returned *)
  CANT_INIT_ISR_INFO     = 332;     (* IOCTL call failed on VDD_API_INIT_ISR_INFO *)
  CANT_PASS_USER_BUFFER  = 333;     (* IOCTL call failed on VDD_API_PASS_USER_BUFFER *)
  CANT_INSTALL_INT       = 334;     (* IOCTL call failed on VDD_API_INSTALL_INT *)
  CANT_UNINSTALL_INT     = 335;     (* IOCTL call failed on VDD_API_UNINSTALL_INT *)
  CANT_START_DMA         = 336;     (* IOCTL call failed on VDD_API_START_DMA *)
  CANT_GET_STATUS        = 337;     (* IOCTL call failed on VDD_API_GET_STATUS *)
  CANT_GET_PRINT_PORT    = 338;     (* IOCTL call failed on VDD_API_GET_PRINT_PORT *)
  CANT_MAP_PCM_CIS       = 339;     (* IOCTL call failed on VDD_API_MAP_PCM_CIS *)
  CANT_GET_PCM_CFG       = 340;     (* IOCTL call failed on VDD_API_GET_PCM_CFG *)
  CANT_GET_PCM_CCSR      = 341;     (* IOCTL call failed on VDD_API_GET_PCM_CCSR *)
  CANT_GET_PCI_INFO      = 342;     (* IOCTL call failed on VDD_API_GET_PCI_INFO *)
  NO_USB_BOARD           = 343;     (* Specified USB board not detected *)
  NOMOREFILES            = 344;     (* No more files in the directory *)
  BADFILENUMBER          = 345;     (* Invalid file number *)
  INVALIDSTRUCTSIZE      = 346;     (* Invalid structure size *)
  LOSSOFDATA             = 347;     (* EOF marker not found, possible loss of data *)
  INVALIDBINARYFILE      = 348;     (* File is not a valid MCC binary file *)
  INVALIDDELIMITER       = 349;     (* Invlid delimiter specified for CSV file *)
  NO_BTH_BOARD           = 350;     (* Specified Bluetooth board not detected *)
  NO_NET_BOARD           = 351;     (* Specified Network board not detected *)

(* DOS errors are remapped by adding DOS_ERR_OFFSET to them *)
  DOS_ERR_OFFSET         = 500;

(* These are the commonly occurring remapped DOS error codes *)
  DOSBADFUNC        = 501;
  DOSFILENOTFOUND   = 502;
  DOSPATHNOTFOUND   = 503;
  DOSNOHANDLES      = 504;
  DOSACCESSDENIED   = 505;
  DOSINVALIDHANDLE  = 506;
  DOSNOMEMORY       = 507;
  DOSBADDRIVE       = 515;
  DOSTOOMANYFILES   = 518;
  DOSWRITEPROTECT   = 519;
  DOSDRIVENOTREADY  = 521;
  DOSSEEKERROR      = 525;
  DOSWRITEFAULT     = 529;
  DOSREADFAULT      = 530;
  DOSGENERALFAULT   = 531;

(* Windows internal error codes *)
  WIN_CANNOT_ENABLE_INT     = 603;
  WIN_CANNOT_DISABLE_INT    = 605;
  WIN_CANT_PAGE_LOCK_BUFFER = 606;
  NO_PCM_CARD               = 630;

(* Maximum length of error string *)
  ERRSTRLEN                 = 256;

(* Maximum length of board name *)
  BOARDNAMELEN              = 64;

(* Status values *)
  IDLE            = 0;
  RUNNING         = 1;


(* Option Flags *)
  FOREGROUND      = $0000;    (* Run in foreground, don't return till done *)
  BACKGROUND      = $0001;    (* Run in background, return immediately *)

  SINGLEEXEC      = $0000;    (* One execution *)
  CONTINUOUS      = $0002;    (* Run continuously until cbstop() called *)

  TIMED           = $0000;    (* Time conversions with internal clock *)
  EXTCLOCK        = $0004;    (* Time conversions with external clock *)

  NOCONVERTDATA   = $0000;    (* Return raw data *)
  CONVERTDATA     = $0008;    (* Return converted A/D data *)

  NODTCONNECT     = $0000;    (* Disable DT Connect *)
  DTCONNECT       = $0010;    (* Enable DT Connect *)
  SCALEDATA       = $0010;    (* Scale scan data to engineering units *)

  DEFAULTIO       = $0000;    (* Use whatever makes sense for board *)
  SINGLEIO        = $0020;    (* Interrupt per A/D conversion *)
  DMAIO           = $0040;    (* DMA transfer *)
  BLOCKIO         = $0060;    (* Interrupt per block of conversions *)
  BURSTIO        = $10000;    (* Transfer upon scan completion *)
  RETRIGMODE     = $20000;    (* Re-arm trigger upon acquiring trigger count samples *)
  NONSTREAMEDIO  = $40000;    (* Non-streamed D/A output *)
  ADCCLOCKTRIG   = $80000;    (* Output operation is triggered on ADC clock *)
  ADCCLOCK      = $100000;    (* Output operation is paced by ADC clock *)
  HIGHRESRATE   = $200000;    (* Use high resolution rate *)
  SHUNTCAL      = $400000;    (* Enable Shunt Calibration *)

  BYTEXFER        = $0000;    (* Digital IN/OUT a byte at a time *)
  WORDXFER        = $0100;    (* Digital IN/OUT a word at a time *)
  DWORDXFER       = $0200;    (* Digital IN/OUT a double word at a time *)

  INDIVIDUAL      = $0000;    (* Individual D/A output *)
  SIMULTANEOUS    = $0200;    (* Simultaneous D/A output *)

  FILTER          = $0000;    (* Filter thermocouple inputs *)
  NOFILTER        = $0400;    (* Disable filtering for thermocouple *)

  NORMMEMORY      = $0000;    (* Return data to data array *)
  EXTMEMORY       = $0800;    (* Send data to memory board ia DT-Connect *)

  BURSTMODE       = $1000;    (* Enable burst mode *)

  NOTODINTS       = $2000;    (* Disbale time-of-day interrupts *)
  WAITFORNEWDATA  = $2000;    (* Wait for new data to become available *)

  EXTTRIGGER      = $4000;     (* A/D is triggered externally *)

  NOCALIBRATEDATA = $8000;    (* Return uncalibrated PCM data *)
  CALIBRATEDATA   = $0000;    (* Return calibrated PCM A/D data *)

  CTR16BIT  = $0000;    (* Return 16-bit counter data *)
  CTR32BIT  = $0100;    (* Return 32-bit counter data *)
  CTR48BIT  = $0200;    (* Return 48-bit counter data *)
  CTR64BIT  = $0400;    (* Return 64-bit counter data *)
  NOCLEAR   = $0800;    (* Disables clearing counters when scan starts *)


  ENABLED         = 1;
  DISABLED        = 0;

  UPDATEIMMEDIATE = 0;
  UPDATEONCOMMAND = 1;

(* Arguments that are used in a particular function call should be set
   to NOTUSED *)
  NOTUSED         = -1;


(* types of error reporting *)
  DONTPRINT       = 0;
  PRINTWARNINGS   = 1;
  PRINTFATAL      = 2;
  PRINTALL        = 3;

(* types of error handling *)
  DONTSTOP        = 0;
  STOPFATAL       = 1;
  STOPALL         = 2;

(* channel types           *)
  ANALOG    = 0;  // Analog channel
  DIGITAL8  = 1;  // 8-bit digital port
  DIGITAL16 = 2;  // 16-bit digital port
  CTR16     = 3;  // 16-bit counter
  CTR32LOW  = 4;  // Lower 16-bits of 32-bit counter
  CTR32HIGH = 5;  // Upper 16-bits of 32-bit counter
  CJC       = 6;  // CJC channel
  TC        = 7;  // Thermocouple channel
  ANALOG_SE = 8;  // Analog channel, singel-ended mode
  ANALOG_DIFF    = 9;  // Analog channel, Differential mode
  SETPOINTSTATUS = 10; // Setpoint status channel
  CTRBANK0  = 11;  // Bank 0 of counter
  CTRBANK1  = 12;  // Bank 1 of counter
  CTRBANK2  = 13;  // Bank 2 of counter
  CTRBANK3  = 14;  // Bank 3 of counter
  PADZERO   = 15;  // Dummy channel. Fills the corresponding data elements with zero

(* channel type flags *)
  SETPOINT_ENABLE = $100;  // Enable setpoint detection

(* setpoint flags *)
  SF_EQUAL_LIMITA       = $00; // Channel = LimitA value
  SF_LESSTHAN_LIMITA    = $01; // Channel < LimitA value
  SF_INSIDE_LIMITS      = $02; // Channel Inside LimitA and LimitB (LimitA < Channel < LimitB)
  SF_GREATERTHAN_LIMITB = $03; // Channel > LimitB
  SF_OUTSIDE_LIMITS     = $04; // Channel Outside LimitA and LimitB (LimitA < Channel or Channel > LimitB)
  SF_HYSTERESIS         = $05; // Use As Hysteresis
  SF_UPDATEON_TRUEONLY  = $00; // Latch output condition (output = output1 for duration of acquisition)
  SF_UPDATEON_TRUEANDFALSE = $08; // Do not latch output condition (output = output1 when criteria met else output = output2)

(* Setpoint output channels *)
  SO_NONE  = 0; // No Output
  SO_DIGITALPORT = 1; // Output to digital Port
  SO_FIRSTPORTC  = 1; // Output to first PortC
  SO_DAC0  = 2; // Output to DAC0
  SO_DAC1  = 3; // Output to DAC1
  SO_DAC2  = 4; // Output to DAC2
  SO_DAC3  = 5; // Output to DAC3
  SO_TMR0  = 6; // Output to TMR0
  SO_TMR1  = 7; // Output to TMR1

(* cbDaqSetTrigger trigger sources *)
  TRIG_IMMEDIATE  = 0;
  TRIG_EXTTTL     = 1;
  TRIG_ANALOG_HW  = 2;
  TRIG_ANALOG_SW  = 3;
  TRIG_DIGPATTERN = 4;
  TRIG_COUNTER    = 5;
  TRIG_SCANCOUNT  = 6;

(* cbDaqSetTrigger trigger sensitivities *)
  RISING_EDGE  = 0;
  FALLING_EDGE = 1;
  ABOVE_LEVEL  = 2;
  BELOW_LEVEL  = 3;
  EQ_LEVEL     = 4;
  NE_LEVEL     = 5;
  HIGH_LEVEL   = 6;
  LOW_LEVEL    = 7;

(* trigger events *)
  START_EVENT = 0;
  STOP_EVENT  = 1;

(* settling time settings *)
  SETTLE_DEFAULT = 0;
  SETTLE_1us     = 1;
  SETTLE_5us     = 2;
  SETTLE_10us    = 3;
  SETTLE_1ms     = 4;

(* Types of digital input ports *)
  DIGITALOUT     = 1;
  DIGITALIN      = 2;

(* DT Modes for cbMemSetDTMode() *)
  DTIN           = 0;
  DTOUT          = 2;

  FROMHERE       = -1;       (* read/write from current position *)
  GETFIRST       = -2;      (* Get first item in list *)
  GETNEXT        = -3;      (* Get next item in list *)

(* Temperature scales *)
  CELSIUS         = 0;
  FAHRENHEIT      = 1;
  KELVIN          = 2;
  VOLTS           = 4;  (* special scale for DAS-TC boards *)
  NOSCALE         = 5;

(* Default option *)
  DEFAULTOPTION   = $0000;


(* Types of digital I/O Ports *)
  AUXPORT         = 1;
  AUXPORT0        = 1;
  AUXPORT1        = 2;
  AUXPORT2        = 3;
  FIRSTPORTA      = 10;
  FIRSTPORTB      = 11;
  FIRSTPORTCL     = 12;
  FIRSTPORTC      = 12;
  FIRSTPORTCH     = 13;
  SECONDPORTA     = 14;
  SECONDPORTB     = 15;
  SECONDPORTCL    = 16;
  SECONDPORTCH    = 17;
  THIRDPORTA      = 18;
  THIRDPORTB      = 19;
  THIRDPORTCL     = 20;
  THIRDPORTCH     = 21;
  FOURTHPORTA     = 22;
  FOURTHPORTB     = 23;
  FOURTHPORTCL    = 24;
  FOURTHPORTCH    = 25;
  FIFTHPORTA      = 26;
  FIFTHPORTB      = 27;
  FIFTHPORTCL     = 28;
  FIFTHPORTCH     = 29;
  SIXTHPORTA      = 30;
  SIXTHPORTB      = 31;
  SIXTHPORTCL     = 32;
  SIXTHPORTCH     = 33;
  SEVENTHPORTA    = 34;
  SEVENTHPORTB    = 35;
  SEVENTHPORTCL   = 36;
  SEVENTHPORTCH   = 37;
  EIGHTHPORTA     = 38;
  EIGHTHPORTB     = 39;
  EIGHTHPORTCL    = 40;
  EIGHTHPORTCH    = 41;


(* Analog input modes *)
  DIFFERENTIAL       = 0;
  SINGLE_ENDED       = 1;
  GROUNDED           = 16;

(* Selectable analog input modes (PCI-6000 series) *)
  RSE            = $1000;      (* Referenced Single-Ended *)
  NRSE           = $2000;      (* Non-Referenced Single-Ended *)
  DIFF           = $4000;      (* Differential *)


(* Selectable A/D Ranges codes *)
  BIP60VOLTS      = 20;     (* -60 to 60 Volts *)
  BIP30VOLTS      = 23;
  BIP20VOLTS      = 15;     (* -20 to +20 Volts *)
  BIP15VOLTS      = 21;     (* -15 to +15 Volts *)
  BIP10VOLTS      = 1;      (* -10 to +10 Volts *)
  BIP5VOLTS       = 0;      (* -5 to +5 Volts *)
  BIP4VOLTS       = 16;     (* -4 to + 4 Volts *)
  BIP2PT5VOLTS    = 2;      (* -2.5 to +2.5 Volts *)
  BIP2VOLTS       = 14;     (* -2.0 to +2.0 Volts *)
  BIP1PT25VOLTS   = 3;      (* -1.25 to +1.25 Volts *)
  BIP1VOLTS       = 4;      (* -1 to +1 Volts *)
  BIPPT625VOLTS   = 5;      (* -.625 to +.625 Volts *)
  BIPPT5VOLTS     = 6;      (* -.5 to +.5 Volts *)
  BIPPT25VOLTS    = 12;     (* -0.25 to +0.25 Volts *)
  BIPPT2VOLTS     = 13;     (* -0.2 to +0.2 Volts *)
  BIPPT1VOLTS     = 7;      (* -.1 to +.1 Volts *)
  BIPPT05VOLTS    = 8;      (* -.05 to +.05 Volts *)
  BIPPT01VOLTS    = 9;      (* -.01 to +.01 Volts *)
  BIPPT005VOLTS   = 10;     (* -.005 to +.005 Volts *)
  BIP1PT67VOLTS   = 11;     (* -1.67 to +1.67 Volts *)
  BIPPT312VOLTS   = 17;     (* -0.312 to +0.312 Volts *)
  BIPPT156VOLTS   = 18;     (* -0.156 to +0.156 Volts *)
  BIPPT125VOLTS   = 22;     (* -0.125 to +0.125 Volts *)
  BIPPT078VOLTS   = 19;     (* -0.078 to +0.078 Volts *)


  UNI10VOLTS      = 100;            (* 0 to 10 Volts *)
  UNI5VOLTS       = 101;            (* 0 to 5 Volts *)
  UNI4VOLTS       = 114;            (* 0 to 4 Volts *)
  UNI2PT5VOLTS    = 102;            (* 0 to 2.5 Volts *)
  UNI2VOLTS       = 103;            (* 0 to 2 Volts *)
  UNI1PT67VOLTS   = 109;            (* 0 to 1.67 Volts *)
  UNI1PT25VOLTS   = 104;            (* 0 to 1.25 Volts *)
  UNI1VOLTS       = 105;            (* 0 to 1 Volt *)
  UNIPT5VOLTS     = 110;            (* 0 to .5 Volt *)
  UNIPT25VOLTS    = 111;            (* 0 to 0.25 Volt *)
  UNIPT2VOLTS     = 112;            (* 0 to .2 Volt *)
  UNIPT1VOLTS     = 106;            (* 0 to .1 Volt *)
  UNIPT05VOLTS    = 113;            (* 0 to .05 Volt *)
  UNIPT02VOLTS    = 108;            (* 0 to .02 Volt *)
  UNIPT01VOLTS    = 107;            (* 0 to .01 Volt *)

  MA4TO20         = 200;            (* 4 to 20 ma *)
  MA2TO10         = 201;            (* 2 to 10 ma *)
  MA1TO5          = 202;            (* 1 to 5 ma *)
  MAPT5TO2PT5     = 203;            (* .5 to 2.5 ma *)
  MA0TO20         = 204;            (* 0 to 20 ma *)
  BIPPT025AMPS    = 205;            (* -0.025 to 0.025 ma *)

  UNIPOLAR   = 300;
  BIPOLAR    = 301;

  BIPPT025VOLTSPERVOLT = 400;    (* -0.025 to +0.025 V/V *)

(* Types of D/A    *)
  ADDA1    = 0;
  ADDA2    = 1;

(* 8536 counter output 1 control *)
  NOTLINKED          = 0;
  GATECTR2           = 1;
  TRIGCTR2           = 2;
  INCTR2             = 3;

(* 8536 trigger types *)
  HW_START_TRIG = 0;
  HW_RETRIG     = 1;
  SW_START_TRIG = 2;

(* Types of 8254 counter configurations *)
  HIGHONLASTCOUNT    = 0;
  ONESHOT            = 1;
  RATEGENERATOR      = 2;
  SQUAREWAVE         = 3;
  SOFTWARESTROBE     = 4;
  HARDWARESTROBE     = 5;

(* Where to reload from for 9513 counters *)
  LOADREG        = 0;
  LOADANDHOLDREG = 1;

(* Counter recycle modes for 9513 and 8536 *)
  ONETIME        = 0;
  RECYCLE        = 1;

(* Direction of counting for 9513 counters *)
  COUNTDOWN      = 0;
  COUNTUP        = 1;

(* Types of count detection for 9513 counters *)
  POSITIVEEDGE   = 0;
  NEGATIVEEDGE   = 1;

(* Counter output control *)
  ALWAYSLOW      = 0;       (* 9513 *)
  HIGHPULSEONTC  = 1;       (* 9513 and 8536 *)
  TOGGLEONTC     = 2;       (* 9513 and 8536 *)
  DISCONNECTED   = 4;       (* 9513 *)
  LOWPULSEONTC   = 5;       (* 9513 *)
  HIGHUNTILTC    = 6;       (* 8536 *)

(* 9513 Counter input sources *)
  TCPREVCTR      = 0;
  CTRINPUT1      = 1;
  CTRINPUT2      = 2;
  CTRINPUT3      = 3;
  CTRINPUT4      = 4;
  CTRINPUT5      = 5;
  GATE1          = 6;
  GATE2          = 7;
  GATE3          = 8;
  GATE4          = 9;
  GATE5          = 10;
  FREQ1          = 11;
  FREQ2          = 12;
  FREQ3          = 13;
  FREQ4          = 14;
  FREQ5          = 15;
  CTRINPUT6      = 101;
  CTRINPUT7      = 102;
  CTRINPUT8      = 103;
  CTRINPUT9      = 104;
  CTRINPUT10     = 105;
  GATE6          = 106;
  GATE7          = 107;
  GATE8          = 108;
  GATE9          = 109;
  GATE10         = 110;
  FREQ6          = 111;
  FREQ7          = 112;
  FREQ8          = 113;
  FREQ9          = 114;
  FREQ10         = 115;
  CTRINPUT11     = 201;
  CTRINPUT12     = 202;
  CTRINPUT13     = 203;
  CTRINPUT14     = 204;
  CTRINPUT15     = 205;
  GATE11         = 206;
  GATE12         = 207;
  GATE13         = 208;
  GATE14         = 209;
  GATE15         = 210;
  FREQ11         = 211;
  FREQ12         = 212;
  FREQ13         = 213;
  FREQ14         = 214;
  FREQ15         = 215;
  CTRINPUT16     = 301;
  CTRINPUT17     = 302;
  CTRINPUT18     = 303;
  CTRINPUT19     = 304;
  CTRINPUT20     = 305;
  GATE16         = 306;
  GATE17         = 307;
  GATE18         = 308;
  GATE19         = 309;
  GATE20         = 310;
  FREQ16         = 311;
  FREQ17         = 312;
  FREQ18         = 313;
  FREQ19         = 314;
  FREQ20         = 315;

(* Counter load registers *)
  LOADREG0       = 0;
  LOADREG1       = 1;
  LOADREG2       = 2;
  LOADREG3       = 3;
  LOADREG4       = 4;
  LOADREG5       = 5;
  LOADREG6       = 6;
  LOADREG7       = 7;
  LOADREG8       = 8;
  LOADREG9       = 9;
  LOADREG10      = 10;
  LOADREG11      = 11;
  LOADREG12      = 12;
  LOADREG13      = 13;
  LOADREG14      = 14;
  LOADREG15      = 15;
  LOADREG16      = 16;
  LOADREG17      = 17;
  LOADREG18      = 18;
  LOADREG19      = 19;
  LOADREG20      = 20;

(* 9513 Counter registers *)
  HOLDREG1       = 101;
  HOLDREG2       = 102;
  HOLDREG3       = 103;
  HOLDREG4       = 104;
  HOLDREG5       = 105;
  HOLDREG6       = 106;
  HOLDREG7       = 107;
  HOLDREG8       = 108;
  HOLDREG9       = 109;
  HOLDREG10      = 110;
  HOLDREG11      = 111;
  HOLDREG12      = 112;
  HOLDREG13      = 113;
  HOLDREG14      = 114;
  HOLDREG15      = 115;
  HOLDREG16      = 116;
  HOLDREG17      = 117;
  HOLDREG18      = 118;
  HOLDREG19      = 119;
  HOLDREG20      = 120;

  ALARM1CHIP1    = 201;
  ALARM2CHIP1    = 202;
  ALARM1CHIP2    = 301;
  ALARM2CHIP2    = 302;
  ALARM1CHIP3    = 401;
  ALARM2CHIP3    = 402;
  ALARM1CHIP4    = 501;
  ALARM2CHIP4    = 502;


(* LS7266 Counter registers *)
  COUNT1         = 601;
  COUNT2         = 602;
  COUNT3         = 603;
  COUNT4         = 604;

  PRESET1        = 701;
  PRESET2        = 702;
  PRESET3        = 703;
  PRESET4        = 704;

  PRESCALER1     = 801;
  PRESCALER2     = 802;
  PRESCALER3     = 803;
  PRESCALER4     = 804;

  MINLIMITREG0       = 900;
  MINLIMITREG1       = 901;
  MINLIMITREG2       = 902;
  MINLIMITREG3       = 903;
  MINLIMITREG4       = 904;
  MINLIMITREG5       = 905;
  MINLIMITREG6       = 906;
  MINLIMITREG7       = 907;

  MAXLIMITREG0       = 1000;
  MAXLIMITREG1       = 1001;
  MAXLIMITREG2       = 1002;
  MAXLIMITREG3       = 1003;
  MAXLIMITREG4       = 1004;
  MAXLIMITREG5       = 1005;
  MAXLIMITREG6       = 1006;
  MAXLIMITREG7       = 1007;

  OUTPUTVAL0REG0 = 1100;
  OUTPUTVAL0REG1 = 1101;
  OUTPUTVAL0REG2 = 1102;
  OUTPUTVAL0REG3 = 1103;
  OUTPUTVAL0REG4 = 1104;
  OUTPUTVAL0REG5 = 1105;
  OUTPUTVAL0REG6 = 1106;
  OUTPUTVAL0REG7 = 1107;

  OUTPUTVAL1REG0 = 1200;
  OUTPUTVAL1REG1 = 1201;
  OUTPUTVAL1REG2 = 1202;
  OUTPUTVAL1REG3 = 1203;
  OUTPUTVAL1REG4 = 1204;
  OUTPUTVAL1REG5 = 1205;
  OUTPUTVAL1REG6 = 1206;
  OUTPUTVAL1REG7 = 1207;

(* Counter Gate Control *)
  NOGATE         = 0;
  AHLTCPREVCTR   = 1;
  AHLNEXTGATE    = 2;
  AHLPREVGATE    = 3;
  AHLGATE        = 4;
  ALLGATE        = 5;
  AHEGATE        = 6;
  ALEGATE        = 7;

(* 7266 Counter Quadrature values *)
  NO_QUAD        = 0;
  X1_QUAD        = 1;
  X2_QUAD        = 2;
  X4_QUAD        = 4;

(* 7266 Counter Counting Modes *)
  NORMAL_MODE    = 0;
  RANGE_LIMIT    = 1;
  NO_RECYCLE     = 2;
  MODULO_N       = 3;

(* 7266 Counter encodings *)
  BCD_ENCODING    = 1;
  BINARY_ENCODING = 2;

(* 7266 Counter Index Modes *)
  INDEX_DISABLED = 0;
  LOAD_CTR       = 1;
  LOAD_OUT_LATCH = 2;
  RESET_CTR      = 3;

(* 7266 Counter Flag Pins *)
  CARRY_BORROW         = 1;
  COMPARE_BORROW       = 2;
  CARRYBORROW_UPDOWN   = 3;
  INDEX_ERROR          = 4;

(* Counter status bits *)
  C_UNDERFLOW    = $0001;
  C_OVERFLOW     = $0002;
  C_COMPARE      = $0004;
  C_SIGN         = $0008;
  C_ERROR        = $0010;
  C_UP_DOWN      = $0020;
  C_INDEX        = $0040;

(* Scan counter mode constants *)
  TOTALIZE          = $0000;
  CLEAR_ON_READ     = $0001;
  ROLLOVER          = $0000;
  STOP_AT_MAX       = $0002;
  DECREMENT_OFF     = $0000;
  DECREMENT_ON      = $0020;
  BIT_16            = $0000;
  BIT_32            = $0004;
  BIT_48            = $10000;
  GATING_OFF        = $0000;
  GATING_ON         = $0010;
  LATCH_ON_SOS      = $0000;
  LATCH_ON_MAP      = $0008;
  UPDOWN_OFF        = $0000;
  UPDOWN_ON         = $1000;
  RANGE_LIMIT_OFF   = $0000;
  RANGE_LIMIT_ON    = $2000;
  NO_RECYCLE_OFF    = $0000;
  NO_RECYCLE_ON     = $4000;
  MODULO_N_OFF      = $0000;
  MODULO_N_ON       = $8000;
  COUNT_DOWN_OFF    = $00000;
  COUNT_DOWN_ON     = $10000;
  INVERT_GATE       = $20000;
  GATE_CONTROLS_DIR = $40000;
  GATE_CLEARS_CTR   = $80000;
  GATE_TRIG_SRC     = $100000;
  OUTPUT_ON         = $200000;
  OUTPUT_INITIAL_STATE_LOW  = $000000;
  OUTPUT_INITIAL_STATE_HIGH = $400000;

  PERIOD                  = $0200;
  PERIOD_MODE_X1          = $0000;
  PERIOD_MODE_X10         = $0001;
  PERIOD_MODE_X100        = $0002;
  PERIOD_MODE_X1000       = $0003;
  PERIOD_MODE_BIT_16      = $0000;
  PERIOD_MODE_BIT_32      = $0004;
  PERIOD_MODE_BIT_48      = $10000;
  PERIOD_MODE_GATING_ON   = $0010;
  PERIOD_MODE_INVERT_GATE = $20000;

  PULSEWIDTH                  = $0300;
  PULSEWIDTH_MODE_BIT_16      = $0000;
  PULSEWIDTH_MODE_BIT_32      = $0004;
  PULSEWIDTH_MODE_BIT_48      = $10000;
  PULSEWIDTH_MODE_GATING_ON   = $0010;
  PULSEWIDTH_MODE_INVERT_GATE = $20000;

  TIMING                   = $0400;
  TIMING_MODE_BIT_16       = $0000;
  TIMING_MODE_BIT_32       = $0004;
  TIMING_MODE_BIT_48       = $10000;
  TIMING_MODE_INVERT_GATE  = $20000;

  ENCODER                      = $0500;
  ENCODER_MODE_X1              = $0000;
  ENCODER_MODE_X2              = $0001;
  ENCODER_MODE_X4              = $0002;
  ENCODER_MODE_BIT_16          = $0000;
  ENCODER_MODE_BIT_32          = $0004;
  ENCODER_MODE_BIT_48          = $10000;
  ENCODER_MODE_LATCH_ON_Z      = $0008;
  ENCODER_MODE_CLEAR_ON_Z_OFF  = $0000;
  ENCODER_MODE_CLEAR_ON_Z_ON   = $0020;
  ENCODER_MODE_RANGE_LIMIT_OFF = $0000;
  ENCODER_MODE_RANGE_LIMIT_ON  = $2000;
  ENCODER_MODE_NO_RECYCLE_OFF  = $0000;
  ENCODER_MODE_NO_RECYCLE_ON   = $4000;
  ENCODER_MODE_MODULO_N_OFF    = $0000;
  ENCODER_MODE_MODULO_N_ON     = $8000;

// obsolete encoder mode constants, use preferred constants above.
  LATCH_ON_Z     = $0008;
  CLEAR_ON_Z_OFF = $0000;
  CLEAR_ON_Z_ON  = $0020;


(* 25xx series counter debounce time constants *)
  CTR_DEBOUNCE500ns     = 0;
  CTR_DEBOUNCE1500ns    = 1;
  CTR_DEBOUNCE3500ns    = 2;
  CTR_DEBOUNCE7500ns    = 3;
  CTR_DEBOUNCE15500ns   = 4;
  CTR_DEBOUNCE31500ns   = 5;
  CTR_DEBOUNCE63500ns   = 6;
  CTR_DEBOUNCE127500ns  = 7;
  CTR_DEBOUNCE100us     = 8;
  CTR_DEBOUNCE300us     = 9;
  CTR_DEBOUNCE700us     = 10;
  CTR_DEBOUNCE1500us    = 11;
  CTR_DEBOUNCE3100us    = 12;
  CTR_DEBOUNCE6300us    = 13;
  CTR_DEBOUNCE12700us   = 14;
  CTR_DEBOUNCE25500us   = 15;
  CTR_DEBOUNCE_NONE     = 16;

(* 25xx series counter debounce trigger constants *)
  CTR_TRIGGER_AFTER_STABLE   = 0;
  CTR_TRIGGER_BEFORE_STABLE  = 1;

(* 25xx series counter edge detection constants *)
  CTR_RISING_EDGE        = 0;
  CTR_FALLING_EDGE       = 1;

(* 25xx series counter tick size constants *)
  CTR_TICK20PT83ns       = 0;
  CTR_TICK208PT3ns       = 1;
  CTR_TICK2083PT3ns      = 2;
  CTR_TICK20833PT3ns     = 3;

(* Types of triggers *)
  TRIGABOVE          = 0;
  TRIGBELOW          = 1;
  GATE_NEG_HYS       = 2;
  GATE_POS_HYS       = 3;
  GATE_ABOVE         = 4;
  GATE_BELOW         = 5;
  GATE_IN_WINDOW     = 6;
  GATE_OUT_WINDOW    = 7;
  GATE_HIGH          = 8;
  GATE_LOW           = 9;
  TRIG_HIGH          = 10;
  TRIG_LOW           = 11;
  TRIG_POS_EDGE      = 12;
  TRIG_NEG_EDGE      = 13;
  TRIG_RISING        = 14;
  TRIG_FALLING       = 15;
  TRIG_PATTERN_EQ    = 16;
  TRIG_PATTERN_NE    = 17;
  TRIG_PATTERN_ABOVE = 18;
  TRIG_PATTERN_BELOW = 19;

(* External Pacer Edge *)
  EXT_PACER_EDGE_RISING  = 1;
  EXT_PACER_EDGE_FALLING = 2;

(* Timer idle state *)
  IDLE_LOW  = 0;
  IDLE_HIGH = 1;

(* Signal I/O Configuration Parameters *)
(* --Connections *)
  AUXIN0          = $01;
  AUXIN1          = $02;
  AUXIN2          = $04;
  AUXIN3          = $08;
  AUXIN4          = $10;
  AUXIN5          = $20;
  AUXOUT0         = $0100;
  AUXOUT1         = $0200;
  AUXOUT2         = $0400;

  DS_CONNECTOR    = $01000;

  MAX_CONNECTIONS = 4;     (* maximum number connections per output signal type *)


(* --Signal Types *)
  ADC_CONVERT     = $0001;
  ADC_GATE        = $0002;
  ADC_START_TRIG  = $0004;
  ADC_STOP_TRIG   = $0008;
  ADC_TB_SRC      = $0010;
  ADC_SCANCLK     = $0020;
  ADC_SSH         = $0040;
  ADC_STARTSCAN   = $0080;
  ADC_SCAN_STOP   = $0100;

  DAC_UPDATE      = $0200;
  DAC_TB_SRC      = $0400;
  DAC_START_TRIG  = $0800;

  SYNC_CLK        = $1000;

  CTR1_CLK        = $2000;
  CTR2_CLK        = $4000;

  DGND            = $8000;

(* -- Signal Direction *)
  SIGNAL_IN       = 2;
  SIGNAL_OUT      = 4;

(* -- Signal Polarity *)
  INVERTED        = 1;
  NONINVERTED     = 0;


(* Types of configuration information *)
  GLOBALINFO        = 1;
  BOARDINFO         = 2;
  DIGITALINFO       = 3;
  COUNTERINFO       = 4;
  EXPANSIONINFO     = 5;
  MISCINFO          = 6;
  EXPINFOARRAY      = 7;
  MEMINFO           = 8;

(* Types of global configuration information *)
  GIVERSION         = 36;      (* Config file format version number *)
  GINUMBOARDS       = 38;      (* Maximum number of boards *)
  GINUMEXPBOARDS    = 40;      (* Maximum number of expansion boards *)

(* Types of board configuration information *)
  BIBASEADR          = 0;       (* Base Address *)
  BIBOARDTYPE        = 1;       (* Board Type (0x101 - 0x7FFF) *)
  BIINTLEVEL         = 2;       (* Interrupt level *)
  BIDMACHAN          = 3;       (* DMA channel *)
  BIINITIALIZED      = 4;       (* TRUE or FALSE *)
  BICLOCK            = 5;       (* Clock freq (1, 10 or bus) *)
  BIRANGE            = 6;       (* Switch selectable range *)
  BINUMADCHANS       = 7;       (* Number of A/D channels *)
  BIUSESEXPS         = 8;       (* Supports expansion boards TRUE/FALSE *)
  BIDINUMDEVS        = 9;       (* Number of digital devices *)
  BIDIDEVNUM         = 10;      (* Index into digital information *)
  BICINUMDEVS        = 11;      (* Number of counter devices *)
  BICIDEVNUM         = 12;      (* Index into counter information *)
  BINUMDACHANS       = 13;      (* Number of D/A channels *)
  BIWAITSTATE        = 14;      (* Wait state enabled TRUE/FALSE *)
  BINUMIOPORTS       = 15;      (* I/O address space used by board *)
  BIPARENTBOARD      = 16;      (* Board number of parent board *)
  BIDTBOARD          = 17;      (* Board number of connected DT board *)
  BINUMEXPS          = 18;      (* Number of EXP boards installed *)

(* NEW CONFIG ITEMS for 32 bit library *)
  BINOITEM            = 99;      (* NO-OP return no data and returns DEVELOPMENT_OPTION error code *)
  BIDACSAMPLEHOLD     = 100;     (* DAC sample and hold jumper state *)
  BIDIOENABLE         = 101;     (* DIO enable *)
  BI330OPMODE         = 102;     (* DAS16-330 operation mode (ENHANCED/COMPATIBLE) *)
  BI9513CHIPNSRC      = 103;     (* 9513 HD CTR source (DevNo = ctr no.) *)
  BICTR0SRC           = 104;     (* CTR 0 source *)
  BICTR1SRC           = 105;     (* CTR 1 source *)
  BICTR2SRC           = 106;     (* CTR 2 source *)
  BIPACERCTR0SRC      = 107;     (* Pacer CTR 0 source *)
  BIDAC0VREF          = 108;     (* DAC 0 voltage reference *)
  BIDAC1VREF          = 109;     (* DAC 1 voltage reference *)
  BIINTP2LEVEL        = 110;     (* P2 interrupt for CTR10 and CTR20HD *)
  BIWAITSTATEP2       = 111;     (* Wait state 2 *)
  BIADPOLARITY        = 112;     (* DAS1600 Polarity state(UNI/BI) *)
  BITRIGEDGE          = 113;     (* DAS1600 trigger edge(RISING/FALLING) *)
  BIDACRANGE          = 114;     (* DAC Range (DevNo is channel) *)
  BIDACUPDATE         = 115;     (* DAC Update (INDIVIDUAL/SIMULTANEOUS) (DevNo) *)
  BIDACINSTALLED      = 116;     (* DAC Installed *)
  BIADCFG             = 117;     (* AD Config (SE/DIFF) (DevNo) *)
  BIADINPUTMODE       = 118;     (* AD Input Mode (Voltage/Current) *)
  BIDACPOLARITY       = 119;     (* DAC Startup state (UNI/BI) *)
  BITEMPMODE          = 120;     (* DAS-TEMP Mode (NORMAL/CALIBRATE) *)
  BITEMPREJFREQ       = 121;     (* DAS-TEMP reject frequency *)
  BIDISOFILTER        = 122;     (* DISO48 line filter (EN/DIS) (DevNo) *)
  BIINT32SRC          = 123;     (* INT32 Intr Src *)
  BIINT32PRIORITY     = 124;     (* INT32 Intr Priority *)
  BIMEMSIZE           = 125;     (* MEGA-FIFO module size *)
  BIMEMCOUNT          = 126;     (* MEGA-FIFO # of modules *)
  BIPRNPORT           = 127;     (* PPIO series printer port *)
  BIPRNDELAY          = 128;     (* PPIO series printer port delay *)
  BIPPIODIO           = 129;     (* PPIO digital line I/O state *)
  BICTR3SRC           = 130;     (* CTR 3 source *)
  BICTR4SRC           = 131;     (* CTR 4 source *)
  BICTR5SRC           = 132;     (* CTR 5 source *)
  BICTRINTSRC         = 133;     (* PCM-D24/CTR3 interrupt source *)
  BICTRLINKING        = 134;     (* PCM-D24/CTR3 ctr linking *)
  BISBX0BOARDNUM      = 135;     (* SBX #0 board number *)
  BISBX0ADDRESS       = 136;     (* SBX #0 address *)
  BISBX0DMACHAN       = 137;     (* SBX #0 DMA channel *)
  BISBX0INTLEVEL0     = 138;     (* SBX #0 Int Level 0 *)
  BISBX0INTLEVEL1     = 139;     (* SBX #0 Int Level 1 *)
  BISBX1BOARDNUM      = 140;     (* SBX #0 board number *)
  BISBX1ADDRESS       = 141;     (* SBX #0 address *)
  BISBX1DMACHAN       = 142;     (* SBX #0 DMA channel *)
  BISBX1INTLEVEL0     = 143;     (* SBX #0 Int Level 0 *)
  BISBX1INTLEVEL1     = 144;     (* SBX #0 Int Level 1 *)
  BISBXBUSWIDTH       = 145;     (* SBX Bus width *)
  BICALFACTOR1        = 146;     (* DAS08/Jr Cal factor *)
  BICALFACTOR2        = 147;     (* DAS08/Jr Cal factor *)
  BIDACTRIG           = 148;     (* PCI-DAS1602 Dac trig edge *)
  BICHANCFG           = 149;     (* 801/802 chan config (devno =ch) *)
  BIPROTOCOL          = 150;     (* 422 protocol *)
  BICOMADDR2          = 151;     (* dual 422 2nd address *)
  BICTSRTS1           = 152;     (* dual 422 cts/rts1 *)
  BICTSRTS2           = 153;     (* dual 422 cts/rts2 *)
  BICTRLLINES         = 154;     (* pcm com 422 ctrl lines *)
  BIWAITSTATEP1       = 155;     (* Wait state P1 *)
  BIINTP1LEVEL        = 156;     (* P1 interrupt for CTR10 and CTR20HD *)
  BICTR6SRC           = 157;     (* CTR 6 source *)
  BICTR7SRC           = 158;     (* CTR 7 source *)
  BICTR8SRC           = 159;     (* CTR 8 source *)
  BICTR9SRC           = 160;     (* CTR 9 source *)
  BICTR10SRC          = 161;     (* CTR 10 source *)
  BICTR11SRC          = 162;     (* CTR 11 source *)
  BICTR12SRC          = 163;     (* CTR 12 source *)
  BICTR13SRC          = 164;     (* CTR 13 source *)
  BICTR14SRC          = 165;     (* CTR 14 source *)
  BITCGLOBALAVG       = 166;  (* DASTC global average *)
  BITCCJCSTATE        = 167;  (* DASTC CJC State(=ON or OFF) *)
  BITCCHANRANGE       = 168;  (* DASTC Channel Gain *)
  BITCCHANTYPE        = 169;  (* DASTC Channel thermocouple type *)
  BITCFWVERSION       = 170;  (* DASTC Firmware Version *)
  BIFWVERSION         = BITCFWVERSION; (* Firmware Version *)
  BIPHACFG            = 180;     (* Quad PhaseA config (devNo =ch) *)
  BIPHBCFG            = 190;     (* Quad PhaseB config (devNo =ch) *)
  BIINDEXCFG          = 200;     (* Quad Index Ref config (devNo =ch) *)
  BISLOTNUM           = 201;     (* PCI/PCM card slot number *)
  BIAIWAVETYPE        = 202;     (* analog input wave type (for demo board) *)
  BIPWRUPSTATE        = 203;     (* DDA06 pwr up state jumper *)
  BIIRQCONNECT        = 204;     (* DAS08 pin6 to 24 jumper *)
  BITRIGPOLARITY      = 205;   (* PCM DAS16xx Trig Polarity *)
  BICTLRNUM           = 206;     (* MetraBus controller board number *)
  BIPWRJMPR           = 207;     (* MetraBus controller board Pwr jumper *)
  BINUMTEMPCHANS      = 208;     (* Number of Temperature channels *)
  BIADTRIGSRC         = 209;     (* A/D trigger source *)
  BIBNCSRC            = 210;     (* BNC source *)
  BIBNCTHRESHOLD      = 211;     (* BNC Threshold 2.5V or 0.0V *)
  BIBURSTMODE         = 212;     (* Board supports BURSTMODE *)
  BIDITHERON          = 213;     (* A/D Dithering enabled *)
  BISERIALNUM         = 214;    (* Serial Number for USB boards *)
  BIDACUPDATEMODE     = 215;    (* Update immediately or upon AOUPDATE command *)
  BIDACUPDATECMD      = 216;    (* Issue D/A UPDATE command *)
  BIDACSTARTUP        = 217;    (* Store last value written for startup *)
  BIADTRIGCOUNT       = 219;    (* Number of samples to acquire per trigger in retrigger mode *)
  BIADFIFOSIZE        = 220;    (* Set FIFO override size for retrigger mode *)
  BIADSOURCE          = 221;    (* Set source to internal reference or external connector(-1) *)
  BICALOUTPUT         = 222;    (* CAL output pin setting *)
  BISRCADPACER        = 223;    (* Source A/D Pacer output *)
  BIMFGSERIALNUM      = 224;    (* Manufacturers 8-byte serial number *)
  BIPCIREVID          = 225;    (* Revision Number stored in PCI header *)
  BIEXTCLKTYPE        = 227;
  BIDIALARMMASK       = 230;

  BINETIOTIMEOUT      = 247;
  BIADCHANAIMODE      = 249;
  BIDACFORCESENSE     = 250;

  BISYNCMODE          = 251;    (* Sync mode *)

  BICALTABLETYPE      = 254;
  BIDIDEBOUNCESTATE   = 255;    (* Digital inputs reset state *)
  BIDIDEBOUNCETIME    = 256;      (* Digital inputs debounce Time *)

  BIPANID             = 258;
  BIRFCHANNEL         = 259;

  BIRSS               = 261;
  BINODEID            = 262;
  BIDEVNOTES          = 263;
  BIINTEDGE           = 265;

  BIADCSETTLETIME     = 270;

  BIFACTORYID         = 272;
  BIHTTPPORT          = 273;
  BIHIDELOGINDLG      = 274;
  BITEMPSCALE         = 280;
  BIDACTRIGCOUNT      = 284; (* Number of samples to generate per trigger in retrigger mode *)
  BIADTIMINGMODE      = 285;
  BIRTDCHANTYPE       = 286;

  BIADRES             = 291;
  BIDACRES            = 292;

  BIADXFERMODE       = 306;
  BICTRTRIGCOUNT     = 307;
  BIDAQITRIGCOUNT    = 308;
  BINETCONNECTCODE   = 341;
  BIDITRIGCOUNT      = 343;    (* Number of digital input samples to acquire per trigger *)
  BIDOTRIGCOUNT      = 344;    (* Number of digital output samples to generate per trigger *)
  BIPATTERNTRIGPORT  = 345;
  BICHANTCTYPE       = 347;    (* Channel thermocouple type *)
  BIEXTINPACEREDGE   = 348;
  BIEXTOUTPACEREDGE  = 349;
  BIINPUTPACEROUT    = 350;  (* Enable/Disable input Pacer output *)
  BIOUTPUTPACEROUT   = 351;  (* Enable/Disable output Pacer output *)
  BITEMPAVG          = 352;
  BIEXCITATION       = 353;
  BICHANBRIDGETYPE   = 354;
  BIADCHANTYPE       = 355;
  BICHANRTDTYPE      = 356;
  BIDEVUNIQUEID      = 357;  (* Unique identifier of DAQ device *)
  BIUSERDEVID        = 358;
  BIDEVVERSION       = 359;
  BITERMCOUNTSTATBIT = 360;
  BIDETECTOPENTC     = 361;
  BIADDATARATE       = 362;
  BIDEVSERIALNUM     = 363;
  BIDEVMACADDR       = 364;
  BIUSERDEVIDNUM     = 365;
  BIADAIMODE         = 373;


(* Type of digital device information *)
  DIBASEADR          = 0;       (* Base address *)
  DIINITIALIZED      = 1;       (* TRUE or FALSE *)
  DIDEVTYPE          = 2;       (* AUXPORT or xPORTA - CH *)
  DIMASK             = 3;       (* Bit mask for this port *)
  DIREADWRITE        = 4;       (* Read required before write *)
  DICONFIG           = 5;       (* Current configuration *)
  DINUMBITS          = 6;       (* Number of bits in port *)
  DICURVAL           = 7;       (* Current value of outputs *)
  DIINMASK           = 8;       (* Input bit mask for port *)
  DIOUTMASK          = 9;       (* Output bit mask for port *)
  DIDISABLEDIRCHECK  = 13;      (* Disables checking port/bit direction in cbDOut and cbDBitOut functions *)

(* Types of counter device information *)
  CIBASEADR          = 0;       (* Base address *)
  CIINITIALIZED      = 1;       (* TRUE or FALSE *)
  CICTRTYPE          = 2;       (* Counter type 8254, 9513 or 8536 *)
  CICTRNUM           = 3;       (* Which counter on chip *)
  CICONFIGBYTE       = 4;       (* Configuration byte *)

(* Types of expansion board information *)
  XIBOARDTYPE        = 0;       (* Board type *)
  XIMUX_AD_CHAN1     = 1;       (* 0 - 7 *)
  XIMUX_AD_CHAN2     = 2;       (* 0 - 7 or NOTUSED *)
  XIRANGE1           = 3;       (* Range (gain) of low 16 chans *)
  XIRANGE2           = 4;       (* Range (gain) of high 16 chans *)
  XICJCCHAN          = 5;       (* TYPE_8254_CTR or TYPE_9513_CTR *)
  XITHERMTYPE        = 6;       (* TYPEJ, TYPEK, TYPET, TYPEE, TYPER, or TYPES *)
  XINUMEXPCHANS      = 7;       (* Number of expansion channels on board *)
  XIPARENTBOARD      = 8;       (* Board number of parent A/D board *)
  XISPARE0           = 9;       (* 16 words of misc options *)

  XI5VOLTSOURCE      = 100;     (* ICAL DATA - 5 volt source *)
  XICHANCONFIG       = 101;     (* exp Data - chan config 2/4 or 3-wire devNo=chan *)
  XIVSOURCE          = 102;     (* ICAL DATA - voltage source *)
  XIVSELECT          = 103;     (* ICAL Data - voltage select *)
  XICHGAIN           = 104;     (* exp Data - individual ch gain *)
  XIGND              = 105;     (* ICAL DATA - exp grounding *)
  XIVADCHAN          = 106;     (* ICAL DATA - Vexe A/D chan *)
  XIRESISTANCE       = 107;     (* exp Data - resistance @0 (devNo =ch) *)
  XIFACGAIN          = 108;     (* ICAL DATA - RTD factory gain *)
  XICUSTOMGAIN       = 109;  (* ICAL DATA - RTD custom gain *)
  XICHCUSTOM         = 110;  (* ICAL DATA - RTD custom gain setting *)
  XIIEXE             = 111;  (* ICAL DATA - RTD Iexe *)

(* Types of memory board information *)
  MIBASEADR          = 100;  (* mem data - base address *)
  MIINTLEVEL         = 101;  (* mem data - intr level *)
  MIMEMSIZE          = 102;  (* MEGA-FIFO module size *)
  MIMEMCOUNT         = 103;  (* MEGA-FIFO # of modules *)

(* AI channel Types *)
  AI_CHAN_TYPE_VOLTAGE          = 0;
  AI_CHAN_TYPE_CURRENT          = 100;
  AI_CHAN_TYPE_RESISTANCE_10K4W = 201;
  AI_CHAN_TYPE_RESISTANCE_1K4W  = 202;
  AI_CHAN_TYPE_RESISTANCE_10K2W = 203;
  AI_CHAN_TYPE_RESISTANCE_1K2W  = 204;
  AI_CHAN_TYPE_TC               = 300;
  AI_CHAN_TYPE_RTD_1000OHM_4W   = 401;
  AI_CHAN_TYPE_RTD_100OHM_4W    = 402;
  AI_CHAN_TYPE_RTD_1000OHM_3W   = 403;
  AI_CHAN_TYPE_RTD_100OHM_3W    = 404;
  AI_CHAN_TYPE_QUART_BRIDGE_350OHM  = 501;
  AI_CHAN_TYPE_QUART_BRIDGE_120OHM  = 502;
  AI_CHAN_TYPE_HALF_BRIDGE          = 503;
  AI_CHAN_TYPE_FULL_BRIDGE_62PT5mVV = 504;
  AI_CHAN_TYPE_FULL_BRIDGE_7PT8mVV  = 505;


(* Thermocouple Types *)
  TC_TYPE_J = 1;
  TC_TYPE_K = 2;
  TC_TYPE_T = 3;
  TC_TYPE_E = 4;
  TC_TYPE_R = 5;
  TC_TYPE_S = 6;
  TC_TYPE_B = 7;
  TC_TYPE_N = 8;

(* Bridge Types *)
  BRIDGE_FULL    = 1;
  BRIDGE_HALF    = 2;
  BRIDGE_QUARTER = 3;

(* Platinum RTD Types *)
  RTD_CUSTOM   = $00;
  RTD_PT_3750  = $01;
  RTD_PT_3851  = $02;
  RTD_PT_3911  = $03;
  RTD_PT_3916  = $04;
  RTD_PT_3920  = $05;
  RTD_PT_3928  = $06;
  RTD_PT_3850  = $07;

(* Version types *)

  VER_FW_MAIN            = 0;
  VER_FW_MEASUREMENT     = 1;
  VER_FW_RADIO           = 2;
  VER_FPGA               = 3;
  VER_FW_MEASUREMENT_EXP = 4;


(* Types of events *)
  ON_SCAN_ERROR          = $0001;
  ON_EXTERNAL_INTERRUPT  = $0002;
  ON_PRETRIGGER          = $0004;
  ON_DATA_AVAILABLE      = $0008;
  ON_END_OF_AI_SCAN      = $0010;
  ON_END_OF_AO_SCAN      = $0020;
  ON_CHANGE_DI           = $0040;
  ALL_EVENT_TYPES        = $ffff;

  NUM_EVENT_TYPES     = 6;
  MAX_NUM_EVENT_TYPES = 32;

  SCAN_ERROR_IDX         = 0;
  EXTERNAL_INTERRUPT_IDX = 1;
  PRETRIGGER_IDX         = 2;
  DATA_AVAILABLE_IDX     = 3;
  END_OF_AI_IDX          = 4;
  END_OF_AO_IDX          = 5;

(* ON_EXTERNAL_INTERRUPT event parameters *)
  LATCH_DI  = 1;
  LATCH_DO  = 2;


// time zone constants
  TIMEZONE_LOCAL = 0;
  TIMEZONE_GMT   = 1;


// time format constants
  TIMEFORMAT_12HOUR = 0;
  TIMEFORMAT_24HOUR = 1;


// delimiter constants
  DELIMITER_COMMA     = 0;
  DELIMITER_SEMICOLON = 1;
  DELIMITER_SPACE     = 2;
  DELIMITER_TAB       = 3;


// AI channel units in binary file
  UNITS_TEMPERATURE = 0;
  UNITS_RAW         = 1;

// Transfer Mode
  XFER_KERNEL = 0;
  XFER_USER   = 1;

// Clock type
  CONTINUOUS_CLK = 1;
  GATED_CLK      = 2;

// Calibration Table types
  CAL_TABLE_FACTORY = 0;
  CAL_TABLE_FIELD   = 1;

type
  DaqDeviceInterface =
  (
    USB_IFC = 1 shl 0,
    BLUETOOTH_IFC = 1 shl 1,
    ETHERNET_IFC = 1 shl 2,
    ANY_IFC = USB_IFC or BLUETOOTH_IFC or ETHERNET_IFC
  );

  UINT = LongWord;
  ULONG = LongWord;
  ULONGLONG = UInt64;
  int = Integer;
  long = Integer;
  unsigned = LongWord;
  short = SmallInt;
  USHORT = Word;
  float = Single;

  DaqDeviceDescriptor = packed record
    ProductName: array [0..63] of AnsiChar;
    ProductID: UINT;   // product ID
    InterfaceType: DaqDeviceInterface;  // USB, BLUETOOTH, ...
    DevString: array [0..63] of AnsiChar;
    UniqueID: array [0..63] of AnsiChar;  // unique identifier for device. Serial number for USB deivces and MAC address for  bth and net devices
    NUID: ULONGLONG;    // numeric representation of uniqueID
    Reserved: array [0..511] of AnsiChar;  // reserved for the future.
  end;

(*
 * Universal Library Function Prototypes.
 * 3 flavors: WIN32, WIN16, LabWindows/CVI
 *
 *)

(* Win32 prototypes *)

const
  cbwdll = 'cbw32.dll';

type
  EVENTCALLBACK = procedure(Param1: int; Param2: unsigned; Param3: unsigned; Param4: Pointer); stdcall;

function cbACalibrateData(BoardNum: int; NumPoints: long; Gain: int; var ADData: USHORT): int; stdcall; external cbwdll delayed;
function cbGetRevision(var RevNum, VxDRevNum: float): int; stdcall; external cbwdll delayed;

function cbLoadConfig(CfgFileName: PAnsiChar): int; stdcall; external cbwdll delayed;
function cbSaveConfig(CfgFileName: PAnsiChar): int; stdcall; external cbwdll delayed;
function cbAConvertData(BoardNum: int; NumPoints: long; var ADData, ChanTags: USHORT): int; stdcall; external cbwdll delayed;
function cbAConvertPretrigData(BoardNum: int; PreTrigCount, TotalCount: long ; var ADData, ChanTags: USHORT): int; stdcall; external cbwdll delayed;
function cbAIn(BoardNum, Chan, Gain: int; var DataValue: USHORT): int; stdcall; external cbwdll delayed;
function cbAIn32(BoardNum, Chan, Gain: int; var DataValue: ULONG; Options: int): int; stdcall; external cbwdll delayed;
function cbAInScan(BoardNum, LowChan, HighChan: int; Count: long; var Rate: long; Gain: int; MemHandle: HGLOBAL; Options: int): int; stdcall; external cbwdll delayed;
function cbALoadQueue(BoardNum: int; var ChanArray, GainArray: short; NumChans: int): int; stdcall; external cbwdll delayed;
function cbAOut(BoardNum, Chan, Gain: int; DataValue: USHORT): int; stdcall; external cbwdll delayed;
function cbAOutScan(BoardNum, LowChan, HighChan: int; Count: long; var Rate: long; Gain: int; MemHandle: HGLOBAL; Options: int): int; stdcall; external cbwdll delayed;
function cbAPretrig(BoardNum, LowChan, HighChan: int; var PreTrigCount, TotalCount, Rate: long; Gain: int; MemHandle: HGLOBAL; Options: int): int; stdcall; external cbwdll delayed;
function cbATrig(BoardNum, Chan, TrigType: int; TrigValue: USHORT; Gain: int; var DataValue: USHORT): int; stdcall; external cbwdll delayed;
function cbC7266Config(BoardNum, CounterNum, Quadrature, CountingMode, DataEncoding, IndexMode, InvertIndex, FlagPins, GateEnable: int): int; stdcall; external cbwdll delayed;
function cbC8254Config(BoardNum, CounterNum, Config: int): int; stdcall; external cbwdll delayed;
function cbC8536Config(BoardNum, CounterNum, OutputControl, RecycleMode, TrigType: int): int; stdcall; external cbwdll delayed;
function cbC9513Config (BoardNum, CounterNum, GateControl, CounterEdge, CountSource, SpecialGate, Reload, RecycleMode, BCDMode, CountDirection, OutputControl: int): int; stdcall; external cbwdll delayed;
function cbC8536Init(BoardNum, ChipNum, Ctr1Output: int): int; stdcall; external cbwdll delayed;
function cbC9513Init(BoardNum, ChipNum, FOutDivider, FOutSource, Compare1, Compare2, TimeOfDay: int): int; stdcall; external cbwdll delayed;
function cbCFreqIn(BoardNum, SigSource, GateInterval: int; var Count: USHORT; var Freq: long): int; stdcall; external cbwdll delayed;
function cbCIn(BoardNum, CounterNum: int; var Count: USHORT): int; stdcall; external cbwdll delayed;
function cbCIn32(BoardNum, CounterNum: int; var Count: ULONG): int; stdcall; external cbwdll delayed;
function cbCIn64(BoardNum, CounterNum: int; var Count: ULONGLONG): int; stdcall; external cbwdll delayed;
function cbCLoad(BoardNum, RegNum: int; LoadValue: unsigned): int; stdcall; external cbwdll delayed;
function cbCLoad32(BoardNum, RegNum: int; LoadValue: ULONG): int; stdcall; external cbwdll delayed;
function cbCLoad64(BoardNum, RegNum: int; LoadValue: ULONGLONG): int; stdcall; external cbwdll delayed;
function cbCStatus(BoardNum, CounterNum: int; var StatusBits: ULONG): int; stdcall; external cbwdll delayed;
function cbCStoreOnInt(BoardNum, IntCount: int; var CntrControl: short; MemHandle: HGLOBAL): int; stdcall; external cbwdll delayed;
function cbCInScan(BoardNum, FirstCtr, LastCtr: int; Count: LONG; var Rate: LONG; MemHandle: HGLOBAL; Options: ULONG): int; stdcall; external cbwdll delayed;
function cbCConfigScan(BoardNum, CounterNum, Mode, DebounceTime, DebounceMode, EdgeDetection, TickSize, MappedChannel: int): int; stdcall; external cbwdll delayed;
function cbCClear(BoardNum, CounterNum: int): int; stdcall; external cbwdll delayed;
function cbTimerOutStart(BoardNum, TimerNum: int; var Frequency: double): int; stdcall; external cbwdll delayed;
function cbTimerOutStop(BoardNum, TimerNum: int): int; stdcall; external cbwdll delayed;
function cbPulseOutStart(BoardNum, TimerNum: int; var Frequency, DutyCycle: double; PulseCount: unsigned; var InitialDelay: double; IdleState, Options: int): int; stdcall; external cbwdll delayed;
function cbPulseOutStop(BoardNum, TimerNum: int): int; stdcall; external cbwdll delayed;
function cbDBitIn(BoardNum, PortType, BitNum: int; var BitValue: USHORT): int; stdcall; external cbwdll delayed;
function cbDBitOut(BoardNum, PortType, BitNum: int; BitValue: USHORT): int; stdcall; external cbwdll delayed;
function cbDConfigPort(BoardNum, PortType, Direction: int): int; stdcall; external cbwdll delayed;
function cbDConfigBit(BoardNum, PortType, BitNum, Direction: int): int; stdcall; external cbwdll delayed;
function cbDIn(BoardNum, PortType: int; var DataValue: USHORT): int; stdcall; external cbwdll delayed;
function cbDIn32(BoardNum, PortType: int; var DataValue: UINT): int; stdcall; external cbwdll delayed;
function cbDInScan(BoardNum, PortType: int; Count: long; var Rate: long; MemHandle: HGLOBAL; Options: int): int; stdcall; external cbwdll delayed;
function cbDOut(BoardNum, PortType: int; DataValue: USHORT): int; stdcall; external cbwdll delayed;
function cbDOut32(BoardNum, PortType: int; DataValue: UINT): int; stdcall; external cbwdll delayed;
function cbDOutScan(BoardNum, PortType: int; Count: long; var Rate: long; MemHandle: HGLOBAL; Options: int): int; stdcall; external cbwdll delayed;
function cbDInArray(BoardNum, LowPort, HighPort: int; var DataArray: ULONG): int; stdcall; external cbwdll delayed;
function cbDOutArray(BoardNum, LowPort, HighPort: int; var DataArray: ULONG): int; stdcall; external cbwdll delayed;
function cbDClearAlarm(BoardNum, PortType: int; Mask: UINT): int; stdcall; external cbwdll delayed;
function cbErrHandling(ErrReporting, ErrHandling: int): int; stdcall; external cbwdll delayed;
function cbFileAInScan(BoardNum, LowChan, HighChan: int; Count: long; var Rate: long; Gain: int; FileName: PAnsiChar; Options: int): int; stdcall; external cbwdll delayed;
function cbFileGetInfo(FileName: PAnsiChar; var LowChan, HighChan: short; var PreTrigCount, TotalCount, Rate: long; var Gain: int): int; stdcall; external cbwdll delayed;
function cbFilePretrig(BoardNum, LowChan, HighChan: int; var PreTrigCount, TotalCount, Rate: long; Gain: int; FileName: PAnsiChar; Options: int): int; stdcall; external cbwdll delayed;
function cbFileRead(FileName: PAnsiChar; FirstPoint: long; var NumPoints: long; var DataBuffer: USHORT): int; stdcall; external cbwdll delayed;
function cbFlashLED(BoardNum: int): int; stdcall; external cbwdll delayed;
function cbGetErrMsg(ErrCode: int; ErrMsg: PAnsiChar): int; stdcall; external cbwdll delayed;
function cbGetIOStatus(BoardNum: int; var Status: short; var CurCount, CurIndex: long; FunctionType: int): int; stdcall; external cbwdll delayed;
function cbRS485(BoardNum, Transmit, Receive: int): int; stdcall; external cbwdll delayed;
function cbStopIOBackground(BoardNum, FunctionType: int): int; stdcall; external cbwdll delayed;
function cbTIn(BoardNum, Chan, Scale: int;  var TempValue: float; Options: int): int; stdcall; external cbwdll delayed;
function cbTInScan(BoardNum, LowChan, HighChan, Scale: int; var DataBuffer: float; Options: int): int; stdcall; external cbwdll delayed;
function cbMemSetDTMode(BoardNum, Mode: int): int; stdcall; external cbwdll delayed;
function cbMemReset(BoardNum: int): int; stdcall; external cbwdll delayed;
function cbMemRead(BoardNum: int; var DataBuffer: USHORT; FirstPoint, Count: long): int; stdcall; external cbwdll delayed;
function cbMemWrite(BoardNum: int; var DataBuffer: USHORT; FirstPoint, Count: long): int; stdcall; external cbwdll delayed;
function cbMemReadPretrig(BoardNum: int; var DataBuffer: USHORT; FirstPoint, Count: long): int; stdcall; external cbwdll delayed;
function cbWinBufToArray(MemHandle: HGLOBAL; var DataArray: USHORT; FirstPoint, Count: long): int; stdcall; external cbwdll delayed;
function cbWinBufToArray32(MemHandle: HGLOBAL; var DataArray: ULONG; FirstPoint, Count: long): int; stdcall; external cbwdll delayed;
function cbWinBufToArray64(MemHandle: HGLOBAL; var DataArray: ULONGLONG; FirstPoint, Count: long): int; stdcall; external cbwdll delayed;
function cbScaledWinBufAlloc(NumPoints: long): HGLOBAL; stdcall; external cbwdll delayed;
function cbScaledWinBufToArray(MemHandle: HGLOBAL; var DataArray: double; FirstPoint, Count: long): int; stdcall; external cbwdll delayed;
function cbWinArrayToBuf(var DataArray: USHORT; MemHandle: HGLOBAL; FirstPoint, Count: long): int; stdcall; external cbwdll delayed;
function cbWinArrayToBuf32(var DataArray: ULONG; MemHandle: HGLOBAL; FirstPoint, Count: long): int; stdcall; external cbwdll delayed;
function cbScaledWinArrayToBuf(var DataArray: double; MemHandle: HGLOBAL; FirstPoint, Count: long): int; stdcall; external cbwdll delayed;
function cbWinBufAlloc(NumPoints: long): HGLOBAL; stdcall; external cbwdll delayed;
function cbWinBufAlloc32(NumPoints: long): HGLOBAL; stdcall; external cbwdll delayed;
function cbWinBufAlloc64(NumPoints: long): HGLOBAL; stdcall; external cbwdll delayed;
function cbWinBufFree(MemHandle: HGLOBAL): int; stdcall; external cbwdll delayed;
function cbInByte(BoardNum, PortNum: int): int; stdcall; external cbwdll delayed;
function cbOutByte(BoardNum, PortNum, PortVal: int): int; stdcall; external cbwdll delayed;
function cbInWord(BoardNum, PortNum: int): int; stdcall; external cbwdll delayed;
function cbOutWord(BoardNum, PortNum, PortVal: int): int; stdcall; external cbwdll delayed;
function cbGetConfig(InfoType, BoardNum, DevNum, ConfigItem: int; var ConfigVal: int): int; stdcall; external cbwdll delayed;
function cbGetConfigString(InfoType, BoardNum, DevNum, ConfigItem: int; ConfigVal: PAnsiChar; var maxConfigLen: int): int; stdcall; external cbwdll delayed;
function cbSetConfig(InfoType, BoardNum, DevNum, ConfigItem, ConfigVal: int): int; stdcall; external cbwdll delayed;
function cbSetConfigString(InfoType, BoardNum, DevNum, ConfigItem: int; ConfigVal: PAnsiChar; var configLen: int): int; stdcall; external cbwdll delayed;
function cbToEngUnits(BoardNum, Range: int; DataVal: USHORT; var EngUnits: float): int; stdcall; external cbwdll delayed;
function cbToEngUnits32(BoardNum, Range: int; DataVal: ULONG; var EngUnits: double): int; stdcall; external cbwdll delayed;
function cbFromEngUnits(BoardNum, Range: int; EngUnits: float; var DataVal: USHORT): int; stdcall; external cbwdll delayed;
function cbGetBoardName(BoardNum: int; BoardName: PAnsiChar): int; stdcall; external cbwdll delayed;
function cbDeclareRevision(var RevNum: float): int; stdcall; external cbwdll delayed;
function cbSetTrigger(BoardNum, TrigType: int; LowThreshold, HighThreshold: USHORT): int; stdcall; external cbwdll delayed;
function cbEnableEvent(BoardNum: int; EventType, Count: unsigned; CallbackFunc: EVENTCALLBACK; UserData: Pointer): int; stdcall; external cbwdll delayed;
function cbDisableEvent(BoardNum: int; EventType: unsigned): int; stdcall; external cbwdll delayed;
function cbSelectSignal(BoardNum, Direction, Signal, Connection, Polarity: int): int; stdcall; external cbwdll delayed;
function cbGetSignal(BoardNum, Direction, Signal, Index: int; var Connection, Polarity: int): int; stdcall; external cbwdll delayed;

function cbSetCalCoeff(BoardNum, FunctionType, Channel, Range, Item, Value, Store: int): int; stdcall; external cbwdll delayed;
function cbGetCalCoeff(BoardNum, FunctionType, Channel, Range, Item: int; var Value: int): int; stdcall; external cbwdll delayed;


 // Get log file name

 // store the preferences
function cbLogSetPreferences(timeFormat, timeZone, units: int): int; stdcall; external cbwdll delayed;

 // get the preferences
function cbLogGetPreferences(var timeFormat, timeZone, units: int): int; stdcall; external cbwdll delayed;

 // Get log file name
function cbLogGetFileName(fileNumber: int; path, filename: PAnsiChar): int; stdcall; external cbwdll delayed;

 // Get info for log file
function cbLogGetFileInfo(filename: PAnsiChar; var version, fileSize: int): int; stdcall; external cbwdll delayed;

 // Get sample info for log file
function cbLogGetSampleInfo(filename: PAnsiChar; var sampleInterval, sampleCount, startDate, startTime: int): int; stdcall; external cbwdll delayed;

 // Get the AI channel count for log file
function cbLogGetAIChannelCount(filename: PAnsiChar; var aiCount: int): int; stdcall; external cbwdll delayed;

 // Get AI info for log file
function cbLogGetAIInfo(filename: PAnsiChar; var channelNumbers, units: int): int; stdcall; external cbwdll delayed;

 // Get CJC info for log file
function cbLogGetCJCInfo(filename: PAnsiChar; var cjcCount: int): int; stdcall; external cbwdll delayed;

 // Get DIO info for log file
function cbLogGetDIOInfo(filename: PAnsiChar; var dioCount: int): int; stdcall; external cbwdll delayed;

 // read the time tags to an array
function cbLogReadTimeTags(filename: PAnsiChar; startSample, count: int; var dateTags, timeTags: int): int; stdcall; external cbwdll delayed;

 // read the analog data to an array
function cbLogReadAIChannels(filename: PAnsiChar; startSample, count: int; var analog: float): int; stdcall; external cbwdll delayed;

 // read the CJC data to an array
function cbLogReadCJCChannels(filename: PAnsiChar; startSample, count: int; var cjc: float): int; stdcall; external cbwdll delayed;

 // read the DIO data to an array
function cbLogReadDIOChannels(filename: PAnsiChar; startSample, count: int; var dio: int): int; stdcall; external cbwdll delayed;

 // convert the log file to a .TXT or .CSV file
function cbLogConvertFile(srcFilename, destFilename: PAnsiChar; startSample, count, delimiter: int): int; stdcall; external cbwdll delayed;

function cbDaqInScan(BoardNum: int; var ChanArray, ChanTypeArray, GainArray: short; ChanCount: int; var Rate, PretrigCount, TotalCount: long; MemHandle: HGLOBAL; Options: int): int; stdcall; external cbwdll delayed;
function cbDaqSetTrigger(BoardNum, TrigSource, TrigSense, TrigChan, ChanType, Gain: int; Level, Variance: float; TrigEvent: int): int; stdcall; external cbwdll delayed;
function cbDaqSetSetpoints(BoardNum: int; var LimitAArray, LimitBArray, Reserved: float; var SetpointFlagsArray, SetpointOutputArray: int; var Output1Array, Output2Array, OutputMask1Array, OutputMask2Array: float; SetpointCount: int): int; stdcall; external cbwdll delayed;

function cbDaqOutScan(BoardNum: int; var ChanArray, ChanTypeArray, GainArray: short; ChanCount: int; var Rate: long; Count: long; MemHandle: HGLOBAL; Options: int): int; stdcall; external cbwdll delayed;
function cbGetTCValues(BoardNum: int; var ChanArray, ChanTypeArray: short; ChanCount: int; MemHandle: HGLOBAL; FirstPoint: int; Count: long; Scale: int; var TempValArray: float): int; stdcall; external cbwdll delayed;

function cbVIn(BoardNum, Chan, Gain: int; var DataValue: float; Options: int): int; stdcall; external cbwdll delayed;
function cbVIn32(BoardNum, Chan, Gain: int; var DataValue: double; Options: int): int; stdcall; external cbwdll delayed;
function cbVOut(BoardNum, Chan, Gain: int; DataValue: float; Options: int): int; stdcall; external cbwdll delayed;

function cbDeviceLogin(BoardNum: int; AccountName, Password: PAnsiChar): int; stdcall; external cbwdll delayed;
function cbDeviceLogout(BoardNum: int): int; stdcall; external cbwdll delayed;

function cbTEDSRead(BoardNum, Chan: int; var DataBuffer: BYTE; var Count: long; Options: int): int; stdcall; external cbwdll delayed;

function cbAInputMode(BoardNum, InputMode: int): int; stdcall; external cbwdll delayed;
function cbAChanInputMode(BoardNum, Chan, InputMode: int): int; stdcall; external cbwdll delayed;

function cbIgnoreInstaCal: int; stdcall; external cbwdll delayed;
function cbCreateDaqDevice(BdNum: int; DeviceDescriptor: DaqDeviceDescriptor): int; stdcall; external cbwdll delayed;
function cbGetDaqDeviceInventory(InterfaceType: DaqDeviceInterface; var Inventory: DaqDeviceDescriptor; var NumberOfDevices: INT): int; stdcall; external cbwdll delayed;
function cbReleaseDaqDevice(BdNum: int): int; stdcall; external cbwdll delayed;
function cbGetBoardNumber(DeviceDescriptor: DaqDeviceDescriptor): int; stdcall; external cbwdll delayed;
function cbGetNetDeviceDescriptor(Host: PAnsiChar; Port: INT; var DeviceDescriptor: DaqDeviceDescriptor; Timeout: INT): int; stdcall; external cbwdll delayed;

//****************************************************************************
//   Legacy Function Prototypes: to revert to legacy calls, un-comment the
//          prototypes immediately below.
//
//      int EXTCCONV cbGetStatus (int BoardNum, short *Status, long *CurCount, long *CurIndex);
//      int EXTCCONV cbStopBackground (int BoardNum);
//
//   Remove the following if using the above legacy function prototypes.

function cbGetStatus(BoardNum: int; var Status: short; var CurCount, CurIndex: long; FunctionType: int): int; stdcall; external cbwdll name 'cbGetIOStatus' delayed;

function cbStopBackground(BoardNum, FunctionType: int): int; stdcall; external cbwdll name 'cbStopIOBackground' delayed;

//****************************************************************************

implementation

end.
