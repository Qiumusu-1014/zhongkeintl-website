import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "中科国际 | Zhongke International",
  description:
    "Zhongke International corporate website for emergency engineering, risk early warning, new energy, and international collaboration.",
  icons: {
    icon: "/favicon.ico",
    apple: "/apple-touch-icon.png",
  },
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="zh-CN">
      <body>{children}</body>
    </html>
  );
}
