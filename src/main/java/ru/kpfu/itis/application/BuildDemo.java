package ru.kpfu.itis.application;

import ru.kpfu.itis.mappers.Client;

public class BuildDemo {
    public static void main(String[] args) {
        Client client = Client.builder()
                        .firstName("Samat")
                        .lastName("Zaydullin")
                        .address("New Demkino")
                        .build();

    }
}