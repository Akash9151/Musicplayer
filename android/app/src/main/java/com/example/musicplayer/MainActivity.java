package com.example.musicplayer;



import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.provider.MediaStore;

import androidx.annotation.NonNull;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {

  private static final String CHANNEL = "Getsongslist";
  ArrayList<String> audioList;
  Context context;

  @Override
  public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
    GeneratedPluginRegistrant.registerWith(flutterEngine);


    audioList = new ArrayList<String>();
    context = getApplicationContext();

    new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
        .setMethodCallHandler(
            (call, result) -> {
              // Note: this method is invoked on the main thread.
              // TODO
              if (call.method.equals("getSongsList")) {
                getSongList();
                if (audioList != null) {
                  result.success(audioList);
                } else {
                  result.error("UNAVAILABLE", "Songs are not available.", null);
                }
              } else {
                result.notImplemented();
              }
            }
    );

  }



  private void getSongList() {

    Uri uri = MediaStore.Audio.Media.EXTERNAL_CONTENT_URI;
    String[] projection = {MediaStore.Audio.AudioColumns.DATA, MediaStore.Audio.AudioColumns.TITLE, MediaStore.Audio.AudioColumns.ALBUM, MediaStore.Audio.ArtistColumns.ARTIST,};
    Cursor c = context.getContentResolver().query(uri, projection, null, null, null, null);


    if (c != null) {
      while (c.moveToNext()) {
//        AudioModel audioModel = new AudioModel();
//        String path = c.getString(0);
        String name = c.getString(1);
        /*String album = c.getString(2);
        String artist = c.getString(3);*/

        /*audioModel.setaPath(path);
        audioModel.setaName(name);
        audioModel.setaAlbum(album);
        audioModel.setaArtist(artist);*/


        audioList.add(name);
      }
      c.close();
    }
  }
}
