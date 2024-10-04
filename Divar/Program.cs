﻿using Divar.Models;
using Microsoft.EntityFrameworkCore;


var builder = WebApplication.CreateBuilder(args);
var cnnString = builder.Configuration.GetConnectionString("DivarConnection");

// Add services to the container.
builder.Services.AddControllersWithViews();
builder.Services.AddDbContext<DivarDbContext>(options => options.UseSqlServer(cnnString));
builder.Services.AddMemoryCache();//base for session
builder.Services.AddSession(); //add Session services to project

var app = builder.Build();





// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();
app.UseDeveloperExceptionPage();
app.UseSession(); //add session to app
app.UseRouting();

app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");



app.Run();
