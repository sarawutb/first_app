import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

List<SnackBar> listSnakber= [
 SnackBar(
              elevation: 0,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              content: AwesomeSnackbarContent(
                title: 'Error',
                message:
                    'เกิดข้อผิดพลาดภายในระบบ error code 400!',
                contentType: ContentType.failure,
              ),
            ),
 SnackBar(
              elevation: 0,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              content: AwesomeSnackbarContent(
                title: 'Success',
                message:
                    'คุณทำรายการถูกต้อง',
                contentType: ContentType.success,
              ),
            ),
 SnackBar(
              elevation: 0,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              content: AwesomeSnackbarContent(
                title: 'Help',
                message:
                    'คุณต้องการคำแนะนำหรือไม่',
                contentType: ContentType.help,
              ),
            ),
 SnackBar(
              elevation: 0,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              content: AwesomeSnackbarContent(
                title: 'Warning',
                message:
                    'ข้อควรระวังในการใช้งานระบบ',
                contentType: ContentType.warning,
              ),
            ),
];