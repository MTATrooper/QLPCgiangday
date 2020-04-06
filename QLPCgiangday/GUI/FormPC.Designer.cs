namespace QLPCgiangday.GUI
{
    partial class FormPC
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.labelControl1 = new DevExpress.XtraEditors.LabelControl();
            this.cbBGV1 = new System.Windows.Forms.ComboBox();
            this.cbBGV2 = new System.Windows.Forms.ComboBox();
            this.labelControl2 = new DevExpress.XtraEditors.LabelControl();
            this.btnOK = new DevExpress.XtraEditors.SimpleButton();
            this.SuspendLayout();
            // 
            // labelControl1
            // 
            this.labelControl1.Appearance.Font = new System.Drawing.Font("Tahoma", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelControl1.Location = new System.Drawing.Point(93, 54);
            this.labelControl1.Name = "labelControl1";
            this.labelControl1.Size = new System.Drawing.Size(75, 16);
            this.labelControl1.TabIndex = 0;
            this.labelControl1.Text = "Giáo viên 1:";
            // 
            // cbBGV1
            // 
            this.cbBGV1.FormattingEnabled = true;
            this.cbBGV1.Location = new System.Drawing.Point(171, 54);
            this.cbBGV1.Name = "cbBGV1";
            this.cbBGV1.Size = new System.Drawing.Size(140, 21);
            this.cbBGV1.TabIndex = 1;
            // 
            // cbBGV2
            // 
            this.cbBGV2.FormattingEnabled = true;
            this.cbBGV2.Location = new System.Drawing.Point(171, 118);
            this.cbBGV2.Name = "cbBGV2";
            this.cbBGV2.Size = new System.Drawing.Size(140, 21);
            this.cbBGV2.TabIndex = 3;
            // 
            // labelControl2
            // 
            this.labelControl2.Appearance.Font = new System.Drawing.Font("Tahoma", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelControl2.Location = new System.Drawing.Point(93, 118);
            this.labelControl2.Name = "labelControl2";
            this.labelControl2.Size = new System.Drawing.Size(75, 16);
            this.labelControl2.TabIndex = 2;
            this.labelControl2.Text = "Giáo viên 2:";
            // 
            // btnOK
            // 
            this.btnOK.Location = new System.Drawing.Point(157, 188);
            this.btnOK.Name = "btnOK";
            this.btnOK.Size = new System.Drawing.Size(75, 23);
            this.btnOK.TabIndex = 11;
            this.btnOK.Text = "OK";
            this.btnOK.Click += new System.EventHandler(this.btnOK_Click);
            // 
            // FormPC
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(404, 272);
            this.Controls.Add(this.btnOK);
            this.Controls.Add(this.cbBGV2);
            this.Controls.Add(this.labelControl2);
            this.Controls.Add(this.cbBGV1);
            this.Controls.Add(this.labelControl1);
            this.Name = "FormPC";
            this.Text = "Phân công";
            this.Load += new System.EventHandler(this.FormPC_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private DevExpress.XtraEditors.LabelControl labelControl1;
        private System.Windows.Forms.ComboBox cbBGV1;
        private System.Windows.Forms.ComboBox cbBGV2;
        private DevExpress.XtraEditors.LabelControl labelControl2;
        private DevExpress.XtraEditors.SimpleButton btnOK;
    }
}