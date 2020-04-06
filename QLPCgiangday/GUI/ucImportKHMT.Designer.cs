namespace QLPCgiangday.GUI
{
    partial class ucImportKHMT
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

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.dataPC_KHMT = new System.Windows.Forms.DataGridView();
            ((System.ComponentModel.ISupportInitialize)(this.dataPC_KHMT)).BeginInit();
            this.SuspendLayout();
            // 
            // dataPC_KHMT
            // 
            this.dataPC_KHMT.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataPC_KHMT.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dataPC_KHMT.Location = new System.Drawing.Point(0, 0);
            this.dataPC_KHMT.Name = "dataPC_KHMT";
            this.dataPC_KHMT.Size = new System.Drawing.Size(834, 454);
            this.dataPC_KHMT.TabIndex = 2;
            // 
            // ucImportKHMT
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.dataPC_KHMT);
            this.Name = "ucImportKHMT";
            this.Size = new System.Drawing.Size(834, 454);
            this.Load += new System.EventHandler(this.ucImportKHMT_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataPC_KHMT)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dataPC_KHMT;
    }
}
