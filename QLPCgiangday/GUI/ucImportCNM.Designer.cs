namespace QLPCgiangday.GUI
{
    partial class ucImportCNM
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
            this.dataPC_CNM = new System.Windows.Forms.DataGridView();
            ((System.ComponentModel.ISupportInitialize)(this.dataPC_CNM)).BeginInit();
            this.SuspendLayout();
            // 
            // dataPC_CNM
            // 
            this.dataPC_CNM.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataPC_CNM.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dataPC_CNM.Location = new System.Drawing.Point(0, 0);
            this.dataPC_CNM.Name = "dataPC_CNM";
            this.dataPC_CNM.Size = new System.Drawing.Size(1070, 482);
            this.dataPC_CNM.TabIndex = 0;
            // 
            // ImportCNM
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.dataPC_CNM);
            this.Name = "ImportCNM";
            this.Size = new System.Drawing.Size(1070, 482);
            this.Load += new System.EventHandler(this.ImportCNM_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataPC_CNM)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dataPC_CNM;
    }
}
