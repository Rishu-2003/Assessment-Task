package railwaysreservation;

public class LandingPage extends javax.swing.JFrame {

    public LandingPage() {
        initComponents();
    }
    
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jCheckBoxMenuItem1 = new javax.swing.JCheckBoxMenuItem();
        jPanel1 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        load = new javax.swing.JProgressBar();
        bar = new javax.swing.JLabel();

        jCheckBoxMenuItem1.setSelected(true);
        jCheckBoxMenuItem1.setText("jCheckBoxMenuItem1");

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setResizable(false);

        jPanel1.setBackground(new java.awt.Color(204, 204, 255));
        jPanel1.setFocusable(false);
        jPanel1.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel1.setFont(new java.awt.Font("Onyx", 1, 24)); // NOI18N
        jLabel1.setForeground(new java.awt.Color(51, 51, 51));
        jLabel1.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel1.setText("Railway Reservation System");
        jPanel1.add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 6, 312, 31));

        jLabel2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/railwaysreservation/landing.png"))); // NOI18N
        jPanel1.add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 40, 310, 280));

        load.setBackground(new java.awt.Color(204, 204, 255));
        load.setForeground(new java.awt.Color(102, 102, 255));
        jPanel1.add(load, new org.netbeans.lib.awtextra.AbsoluteConstraints(30, 300, 250, 10));

        bar.setFont(new java.awt.Font("Arial Rounded MT Bold", 0, 14)); // NOI18N
        bar.setForeground(new java.awt.Color(102, 102, 255));
        bar.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jPanel1.add(bar, new org.netbeans.lib.awtextra.AbsoluteConstraints(130, 280, 70, -1));

        getContentPane().add(jPanel1, java.awt.BorderLayout.CENTER);

        pack();
        setLocationRelativeTo(null);
    }// </editor-fold>//GEN-END:initComponents

    public static void main(String args[]) {
        
        LandingPage obj=new LandingPage();
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                obj.setVisible(true);    
            }
        });
        LoginPage login=new LoginPage();
        try{
            for(int i=0;i<=100;i++){
                Thread.sleep(70);
                obj.load.setValue(i);
                obj.bar.setText(i+"%");
            }
        }catch(Exception e){
            
        }
        login.setVisible(true);  
        obj.setVisible(false);  
        
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel bar;
    private javax.swing.JCheckBoxMenuItem jCheckBoxMenuItem1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JProgressBar load;
    // End of variables declaration//GEN-END:variables
}
