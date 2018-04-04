package com.zoltanfraknoi.javasockettest;

import android.app.Application;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Toast;

import java.io.IOException;

public class MainActivity extends AppCompatActivity
{
    String IpAddress = "192.168.43.40";
    int port = 7360;

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    public void BtnTestClick(View view)
    {
        Toast.makeText(this, "test", Toast.LENGTH_LONG).show();

        try
        {
            SocketTest();
        } catch (IOException e)
        {
            e.printStackTrace();
        }
    }

    public void SocketTest() throws IOException
    {
        // Socket has to be on a different thread as the UI
        new Thread(new Runnable() {
            public void run() {
                try {
                    GreetClient client = new GreetClient();
                    client.startConnection(IpAddress, port);
                    String response = client.sendMessage("move");


                } catch (IOException e) {
                    e.printStackTrace();
                }

            }
        }).start();

    }


}
