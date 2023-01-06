package com.translator.translator

import android.annotation.TargetApi
import android.app.PendingIntent
import android.appwidget.AppWidgetManager
import android.content.Context
import android.content.Intent
import android.content.SharedPreferences
import android.net.Uri
import android.os.Build
import android.widget.RemoteViews

import es.antonborri.home_widget.HomeWidgetBackgroundIntent
import es.antonborri.home_widget.HomeWidgetLaunchIntent
import es.antonborri.home_widget.HomeWidgetProvider


class HomeWidget : HomeWidgetProvider() {

    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray, widgetData: SharedPreferences
    ) {
        appWidgetIds.forEach { appWidgetId ->
            val pendingIntent: PendingIntent = PendingIntent.getActivity(
                context,
                0,
                Intent(context, MainActivity::class.java),
                PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
            )
            val views: RemoteViews = RemoteViews(
                context.packageName,
                R.layout.app_widget
            ).apply {
                setOnClickPendingIntent(R.id.widget_container, pendingIntent)
            }
            appWidgetManager.updateAppWidget(appWidgetId, views)
        }
    }

//    override fun onUpdate(
//        context: Context,
//        appWidgetManager: AppWidgetManager,
//        appWidgetIds: IntArray, widgetData: SharedPreferences
//    ) {
//        appWidgetIds.forEach { widgetId ->
//            val views = RemoteViews(context.packageName, R.layout.app_widget).apply {
//
//                // Open App on Widget Click
//                val pendingIntent = HomeWidgetLaunchIntent.getActivity(
//                    context,
//                    MainActivity::class.java
//                )
//                setOnClickPendingIntent(R.id.widget_container, pendingIntent)
//
//
//                // Swap Title Text by calling Dart Code in the Background
//                setTextViewText(R.id.widget_title, "All language translator")
//                val backgroundIntent = HomeWidgetBackgroundIntent.getBroadcast(
//                    context,
//                    Uri.parse("appWidgets://titleClicked")
//                )
//                setOnClickPendingIntent(R.id.widget_title, backgroundIntent)
//
//                val message = widgetData.getString("message", null)
//                setTextViewText(R.id.widget_message, message)
//                // Detect App opened via Click inside Flutter
//                val pendingIntentWithData = HomeWidgetLaunchIntent.getActivity(
//                    context,
//                    MainActivity::class.java,
//                    Uri.parse("appWidgets://message?message=")
//                )
//                setOnClickPendingIntent(R.id.widget_message, pendingIntentWithData)
//            }
//
//            appWidgetManager.updateAppWidget(widgetId, views)
//        }
//    }
}